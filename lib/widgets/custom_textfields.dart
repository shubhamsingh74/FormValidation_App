import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final Icon? suffixIcon;
  final keyboardType;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
