import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final maxLines;
  final Widget? suffixIcon; // Specify type as Widget
  final FocusNode? focusNode; // Specify type as FocusNode
  final TextEditingController
      controller; // Specify type as TextEditingController
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted; // Specify function type
  final TextInputType keyboardType; // Specify type as TextInputType

  const MyTextField({
    super.key,
    this.suffixIcon,
    this.onFieldSubmitted,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
    this.focusNode, // Made focusNode nullable
    required this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        maxLines: maxLines,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        controller: controller,
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        keyboardType: keyboardType, // Pass keyboardType directly here
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
