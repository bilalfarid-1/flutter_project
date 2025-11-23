import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Add Package')),
      body: const Center(child: Text('')),
    );
  }
}
