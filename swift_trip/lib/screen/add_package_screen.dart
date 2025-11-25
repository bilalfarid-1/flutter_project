import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_trip/widgets/package_form.dart';

class AddPackageScreen extends StatefulWidget {
  const AddPackageScreen({super.key});

  @override
  State<AddPackageScreen> createState() => _AddPackageScreenState();
}

class _AddPackageScreenState extends State<AddPackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text('Add Package')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PackageForm(
              onSubmit: (formData) async {
                await _savePackage(formData);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _savePackage(Map<String, dynamic> formData) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You must be signed in to add a package'),
            ),
          );
        }
        return;
      }

      final title = (formData['title'] ?? '').toString();
      final fromCity = (formData['fromCity'] ?? '').toString();
      final toCity = (formData['toCity'] ?? '').toString();
      final description = (formData['description'] ?? '').toString();
      final imageUrl = (formData['imageUrl'] ?? '').toString();
      final price = (formData['price'] is num)
          ? formData['price'] as num
          : double.tryParse((formData['price'] ?? '0').toString()) ?? 0.0;
      final totalSeats = (formData['totalSeats'] is int)
          ? formData['totalSeats'] as int
          : int.tryParse((formData['totalSeats'] ?? '0').toString()) ?? 0;
      final start = formData['startDate'] as DateTime? ?? DateTime.now();
      final end =
          formData['endDate'] as DateTime? ??
          DateTime.now().add(const Duration(days: 1));

      final data = {
        'title': title,
        'fromCity': fromCity,
        'toCity': toCity,
        'description': description,
        'imageUrl': imageUrl,
        'price': price,
        'totalSeats': totalSeats,
        'seatsLeft': totalSeats,
        'startDate': Timestamp.fromDate(start),
        'endDate': Timestamp.fromDate(end),
        'organizerId': uid,
        'status': 'active',
        'createdAt': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('packages').add(data);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Package saved successfully')),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save package: $e')));
      }
    }
  }
}
