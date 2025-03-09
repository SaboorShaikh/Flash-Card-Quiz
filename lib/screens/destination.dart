import 'package:flashcard_quiz1/screens/level_3_question.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/cross_icon.dart';

class Destination extends StatefulWidget {
  const Destination({super.key});

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 50.0, left: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA58ED2), Color(0xFFCFA7DD), Color(0xFFF6BFEA)],
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
            Image.asset(
              "images/destination.png",
            ),
            const Text(
              "Level 3",
              style: TextStyle(
                color: Color(0xFFFFFFE5),
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Experienced",
              style: TextStyle(
                color: Color(0xE6FFFFE5),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              "You're a true globetrotter! Get ready for the ultimate travel challenge!",
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
                  MaterialPageRoute(builder: (context) => level_3_question()),
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
                        "Start",
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
