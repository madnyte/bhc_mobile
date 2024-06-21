import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide()),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
          filled: true,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
