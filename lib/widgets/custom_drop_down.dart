import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> itemsList;
  final void Function(String?) onChanged;
  final String hintText;
  final TextStyle hintStyle;
  final String? value;

  const CustomDropDown({
    super.key,
    required this.itemsList,
    required this.onChanged,
    required this.hintText,
    required this.hintStyle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(
        hintText,
        style: hintStyle,
      ),
      value: value,
      items: itemsList.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value, style: hintStyle),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
