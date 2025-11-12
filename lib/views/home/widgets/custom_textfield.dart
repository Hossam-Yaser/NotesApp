import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  void Function(String?)? onSaved;

  CustomTextfield({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.onSaved,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      maxLines: maxLines,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.cyan, width: 2),
        ),
      ),
    );
  }
}
