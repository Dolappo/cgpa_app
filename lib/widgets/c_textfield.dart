import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  const CTextField({
    this.hintText,
   required this.controller,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
