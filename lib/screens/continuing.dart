import 'package:flashcard_quiz1/screens/level_2_question.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/cross_icon.dart';

class Continuing extends StatefulWidget {
  const Continuing({super.key});

  @override
  State<Continuing> createState() => _ContinuingState();
}

class _ContinuingState extends State<Continuing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 50.0, left: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF348EF2), Color(0xFF4183F1), Color(0xFF5177EE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const cross_icon(),
            ),
            Image.asset("images/balloon_color.png"),
            const Text(
              "Level 2",
              style: TextStyle(
                color: Color(0xFFFFFFE5),
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Continuing",
              style: TextStyle(
                color: Color(0xE6FFFFE5),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              "Do you feel confident? Here you'll challenge one of our most difficult travel questions!",
              style: TextStyle(
                color: Color(0xCCFFFFE5),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => level_2_question()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 7.0,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Color(0xFF5177EE),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
