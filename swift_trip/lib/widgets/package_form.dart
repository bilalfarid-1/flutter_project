import 'package:flutter/material.dart';

class PackageForm extends StatefulWidget {
  final Map<String, dynamic>? initialData;
  final Function(Map<String, dynamic> formData) onSubmit;

  const PackageForm({super.key, this.initialData, required this.onSubmit});

  @override
  State<PackageForm> createState() => _PackageFormState();
}

class _PackageFormState extends State<PackageForm> {
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

  @override
  void initState() {
    super.initState();
    final data = widget.initialData;
    if (data != null) {
      _titleCtrl.text = (data['title'] ?? '').toString();
      _fromCityCtrl.text = (data['fromCity'] ?? '').toString();
      _toCityCtrl.text = (data['toCity'] ?? '').toString();
      _priceCtrl.text = (data['price'] ?? '').toString();
      _descriptionCtrl.text = (data['description'] ?? '').toString();
      _totalSeatsCtrl.text = (data['totalSeats'] ?? '').toString();
      _imageUrlCtrl.text = (data['imageUrl'] ?? '').toString();
      if (data['startDate'] is DateTime) startDate = data['startDate'];
      if (data['endDate'] is DateTime) endDate = data['endDate'];
    }
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

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => startDate = picked);
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => endDate = picked);
  }

  void _handleSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final price = double.tryParse(_priceCtrl.text.trim()) ?? 0.0;
    final totalSeats = int.tryParse(_totalSeatsCtrl.text.trim()) ?? 0;

    final formData = {
      'title': _titleCtrl.text.trim(),
      'fromCity': _fromCityCtrl.text.trim(),
      'toCity': _toCityCtrl.text.trim(),
      'price': price,
      'description': _descriptionCtrl.text.trim(),
      'totalSeats': totalSeats,
      'imageUrl': _imageUrlCtrl.text.trim(),
      'startDate': startDate,
      'endDate': endDate,
    };

    widget.onSubmit(formData);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleCtrl,
            decoration: const InputDecoration(labelText: 'Title'),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Enter title' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _fromCityCtrl,
            decoration: const InputDecoration(labelText: 'From City'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _toCityCtrl,
            decoration: const InputDecoration(labelText: 'To City'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _priceCtrl,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Start Date',
                    hintText: startDate.toLocal().toString().split(' ')[0],
                  ),
                  onTap: _pickStartDate,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'End Date',
                    hintText: endDate.toLocal().toString().split(' ')[0],
                  ),
                  onTap: _pickEndDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _totalSeatsCtrl,
            decoration: const InputDecoration(labelText: 'Total Seats'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _descriptionCtrl,
            decoration: const InputDecoration(labelText: 'Description'),
            maxLines: 4,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _imageUrlCtrl,
            decoration: const InputDecoration(labelText: 'Image URL'),
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _isSaving ? null : _handleSubmit,
              child: _isSaving
                  ? const CircularProgressIndicator()
                  : const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
