import 'package:flutter/material.dart';

class cross_icon extends StatelessWidget {
  const cross_icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white60),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
