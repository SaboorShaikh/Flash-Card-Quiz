import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String optionText;
  final Color color;
  final VoidCallback onTap;

  const Options({
    Key? key,
    required this.optionText,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Text(
          optionText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
