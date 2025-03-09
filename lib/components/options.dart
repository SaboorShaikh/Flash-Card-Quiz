import 'package:flutter/material.dart';

class options extends StatelessWidget {
  const options({super.key, required this.optionText});

  final String optionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          optionText,
          style: const TextStyle(
              color: Color(0xFF5177EE),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
