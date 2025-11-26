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
  Future<void> _handleSubmit(Map<String, dynamic> formData) async {
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

      // Add organizerId, status, and createdAt
      final data = {
        ...formData,
        'organizerId': uid,
        'status': 'active',
        'createdAt': FieldValue.serverTimestamp(),
        'seatsLeft': formData['totalSeats'] ?? 0,
        'startDate': Timestamp.fromDate(formData['startDate'] as DateTime),
        'endDate': Timestamp.fromDate(formData['endDate'] as DateTime),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text('Add Package')),
      body: PackageForm(onSubmit: _handleSubmit),
    );
  }
}
