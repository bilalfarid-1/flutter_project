import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CityDropdown extends StatelessWidget {
  final List<String> cities;
  final String value;
  final String hintText;
  final ValueChanged<String?> onChanged;

  const CityDropdown({
    super.key,
    required this.cities,
    required this.value,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownSearch<String>(
        items: (String? filter, _) {
          if (filter == null || filter.isEmpty) return cities;
          final f = filter.toLowerCase();
          return cities
              .where((c) => c.toLowerCase().contains(f))
              .toList();
        },

        selectedItem: value.isEmpty ? null : value,

        popupProps: const PopupProps.menu(
          showSearchBox: true,
        ),

        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF9FAFB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 2,
              ),
            ),
            hintText: hintText,
          ),
        ),

        onChanged: onChanged,
      ),
    );
  }
}