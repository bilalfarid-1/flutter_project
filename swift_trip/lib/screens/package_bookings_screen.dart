import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swift_trip/widgets/package_booking_card.dart';

class PackageBookingsScreen extends StatefulWidget {
  const PackageBookingsScreen({super.key});

  @override
  State<PackageBookingsScreen> createState() => _PackageBookingsScreenState();
}

class _PackageBookingsScreenState extends State<PackageBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Package Bookings')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .orderBy('bookingDate', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) {
            return const Center(child: Text('No bookings found'));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = (doc.data() as Map<String, dynamic>?) ?? {};
              final id = doc.id;
              return PackageBookingCard(data: data, bookingId: id);
            },
          );
        },
      ),
    );
  }
}
