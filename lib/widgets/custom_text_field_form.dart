import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String) onChanged;

  const CustomTextFieldForm({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    required this.controller,
    required this.validator,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 18,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.3,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.3,
              ),
            ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffFF2D1B),
            width: 1.3,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffFF2D1B),
            width: 1.3,
          ),
        ),
        label: Text(
          hintText,
          style: hintStyle ??
              const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? const Color.fromARGB(255, 255, 255, 255),
        filled: false,
      ),
      obscureText: isObscureText ?? false,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      validator: (value) {
        return validator(value);
      },
      onChanged: onChanged,
    );
  }
}
