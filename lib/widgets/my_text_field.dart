import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final suffixIcon;
  final focusNode;
  final controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final onFieldSubmitted;

  const MyTextField(
      {super.key,
      this.suffixIcon,
      this.onFieldSubmitted,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.validator,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        controller: controller,
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary)),
          // fillColor: Colors.grey.shade200,
          // filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
