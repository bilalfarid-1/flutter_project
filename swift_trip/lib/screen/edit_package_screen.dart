import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_trip/widgets/package_form.dart';

class EditPackageScreen extends StatefulWidget {
  final String packageId;
  final Map<String, dynamic> currentData;

  const EditPackageScreen({
    super.key,
    required this.packageId,
    required this.currentData,
  });

  @override
  State<EditPackageScreen> createState() => _EditPackageScreenState();
}

class _EditPackageScreenState extends State<EditPackageScreen> {
  Future<void> _handleSubmit(Map<String, dynamic> formData) async {
    try {
      // Convert DateTime objects to Firestore Timestamps
      final data = {
        ...formData,
        'startDate': Timestamp.fromDate(formData['startDate'] as DateTime),
        'endDate': Timestamp.fromDate(formData['endDate'] as DateTime),
      };

      await FirebaseFirestore.instance
          .collection('packages')
          .doc(widget.packageId)
          .update(data);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Package updated successfully')),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update package: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text('Edit Package')),
      body: PackageForm(
        initialData: widget.currentData,
        onSubmit: _handleSubmit,
      ),
    );
  }
}
