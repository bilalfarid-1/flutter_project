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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Enter title' : null,
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
                        onTap: _pickStartDate,
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
                        onTap: _pickEndDate,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // DESCRIPTION section
                _buildSectionHeader('DESCRIPTION'),
                TextFormField(
                  controller: _descriptionCtrl,
                  decoration: _buildInputDecoration('Description'),
                  maxLines: 4,
                  maxLength: 500,
                ),
                const SizedBox(height: 12),

                // IMAGE URL section with live preview
                _buildSectionHeader('IMAGE URL'),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _imageUrlCtrl,
                  builder: (context, value, child) {
                    final url = value.text.trim();
                    final Widget suffix = url.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                              errorBuilder: (ctx, err, st) => const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : const Icon(Icons.image, color: Colors.grey);

                    return TextFormField(
                      controller: _imageUrlCtrl,
                      decoration: _buildInputDecoration(
                        'Image URL',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: suffix,
                        ),
                      ),
                      keyboardType: TextInputType.url,
                    );
                  },
                ),
                const SizedBox(height: 24),

                // SAVE BUTTON (styled)
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
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
                        : const Text(
                            'Save Package',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
