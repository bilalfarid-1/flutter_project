import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPackageScreen extends StatefulWidget {
  const AddPackageScreen({super.key});

  @override
  State<AddPackageScreen> createState() => _AddPackageScreenState();
}

class _AddPackageScreenState extends State<AddPackageScreen> {
  // Text controllers
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _fromCityCtrl = TextEditingController();
  final TextEditingController _toCityCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  final TextEditingController _totalSeatsCtrl = TextEditingController();
  final TextEditingController _imageUrlCtrl = TextEditingController();

  // Date state
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 1));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSaving = false;

  // Helper: boxed input decoration for consistent field styling
  InputDecoration _buildInputDecoration(String label, {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      suffixIcon: suffixIcon,
    );
  }

  // Helper: section header widget
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _fromCityCtrl.dispose();
    _toCityCtrl.dispose();
    _priceCtrl.dispose();
    _descriptionCtrl.dispose();
    _totalSeatsCtrl.dispose();
    _imageUrlCtrl.dispose();
    super.dispose();
  }

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // PACKAGE DETAILS
                  _buildSectionHeader('PACKAGE DETAILS'),
                  TextFormField(
                    controller: _titleCtrl,
                    decoration: _buildInputDecoration('Title'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _fromCityCtrl,
                    decoration: _buildInputDecoration('From City'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _toCityCtrl,
                    decoration: _buildInputDecoration('To City'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _priceCtrl,
                    decoration: _buildInputDecoration('Price'),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 16),

                  // CAPACITY & DATES
                  _buildSectionHeader('CAPACITY & DATES'),
                  TextFormField(
                    controller: _totalSeatsCtrl,
                    decoration: _buildInputDecoration('Total Seats'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: TextEditingController(
                            text: startDate.toLocal().toString().split(' ')[0],
                          ),
                          readOnly: true,
                          decoration: _buildInputDecoration('Start Date'),
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: startDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null)
                              setState(() => startDate = picked);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: TextEditingController(
                            text: endDate.toLocal().toString().split(' ')[0],
                          ),
                          readOnly: true,
                          decoration: _buildInputDecoration('End Date'),
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: endDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null)
                              setState(() => endDate = picked);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // remaining fields
                  TextFormField(
                    controller: _descriptionCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _imageUrlCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isSaving
                          ? null
                          : () async {
                              await _savePackage();
                            },
                      child: _isSaving
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text('Save Package'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _savePackage() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
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

      final title = _titleCtrl.text.trim();
      final fromCity = _fromCityCtrl.text.trim();
      final toCity = _toCityCtrl.text.trim();
      final description = _descriptionCtrl.text.trim();
      final imageUrl = _imageUrlCtrl.text.trim();
      final price = double.tryParse(_priceCtrl.text.trim()) ?? 0.0;
      final totalSeats = int.tryParse(_totalSeatsCtrl.text.trim()) ?? 0;

      final data = {
        'title': title,
        'fromCity': fromCity,
        'toCity': toCity,
        'description': description,
        'imageUrl': imageUrl,
        'price': price,
        'totalSeats': totalSeats,
        'seatsLeft': totalSeats,
        'startDate': Timestamp.fromDate(startDate),
        'endDate': Timestamp.fromDate(endDate),
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
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}
