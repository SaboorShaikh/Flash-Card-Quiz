import 'package:flutter/material.dart';

class person_icon extends StatelessWidget {
  const person_icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(30)),
      child: const Icon(
        Icons.person,
        color: Colors.blue,
      ),
    );
  }
}
