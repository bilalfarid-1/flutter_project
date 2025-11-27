import 'package:cloud_firestore/cloud_firestore.dart';

class BookingService {
  final FirebaseFirestore _firestore;

  BookingService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> bookPackage(
    String packageId,
    String userId,
    int seats,
    double pricePerPerson,
  ) async {
    final packageRef = _firestore.collection('packages').doc(packageId);
    final bookingsColl = _firestore.collection('bookings');

    await _firestore.runTransaction((transaction) async {
      final pkgSnapshot = await transaction.get(packageRef);

      if (!pkgSnapshot.exists) {
        throw Exception('Package not found');
      }

      final pkgData = pkgSnapshot.data() as Map<String, dynamic>;

      // Support both 'seatsLeft' and legacy 'seats_left' keys and different types
      final seatsLeftRaw = pkgData['seatsLeft'] ?? pkgData['seats_left'] ?? 0;
      final currentSeatsLeft = seatsLeftRaw is num
          ? seatsLeftRaw.toInt()
          : int.tryParse(seatsLeftRaw.toString()) ?? 0;

      if (currentSeatsLeft < seats) {
        throw Exception('Not enough seats available');
      }

      final totalPrice = seats * pricePerPerson;

      // Update package: decrement seatsLeft
      transaction.update(packageRef, {'seatsLeft': currentSeatsLeft - seats});

      // Create booking document
      final bookingRef = bookingsColl.doc();
      transaction.set(bookingRef, {
        'userId': userId,
        'packageId': packageId,
        'seats': seats,
        'totalPrice': totalPrice,
        'bookingDate': FieldValue.serverTimestamp(),
        'status': 'confirmed',
      });
    });
  }
}
