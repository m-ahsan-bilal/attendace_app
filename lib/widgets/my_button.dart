import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // const MyWidget({super.key});
  final Function()? onTap;
  final String title;

  const MyButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
