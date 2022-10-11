import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String? hintText;
  final void Function(String?)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  const CTextField({
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.controller,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
