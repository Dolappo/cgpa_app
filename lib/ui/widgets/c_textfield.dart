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
          focusedBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.blueGrey.shade200,
          filled: true,
          hintText: hintText,
        ),
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
