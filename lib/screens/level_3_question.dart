import 'package:flashcard_quiz1/components/cross_icon.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/options.dart';
import 'dart:async';

class level_3_question extends StatefulWidget {
  const level_3_question({super.key});

  @override
  State<level_3_question> createState() => _level_3_questionState();
}

class _level_3_questionState extends State<level_3_question> {
  int currentQuestion = 1;
  String correctAnswer = "Atlanta";
  String? selectedAnswer;

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (currentQuestion < 10) {
          currentQuestion++;
          selectedAnswer = null;
        } else {
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFA58ED2),
            Color(0xFFCFA7DD),
            Color(0xFFF6BFEA),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const cross_icon(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "$currentQuestion",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white60),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            color: Color(0xFFFFFFE6),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30.0),
            Image.asset("images/finals.png"),
            Text(
              "Question $currentQuestion of 10",
              style: const TextStyle(
                  color: Color(0xFFFFFFE6),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              "Q: Which city is home to the world’s busiest airport by passenger traffic?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            Options(
              optionText: "Dubai",
              color: selectedAnswer == "Dubai"
                  ? (correctAnswer == "Dubai" ? Colors.green : Colors.red)
                  : Colors.white,
              onTap: () => checkAnswer("Dubai"),
            ),
            const SizedBox(height: 30.0),
            Options(
              optionText: "Atlanta",
              color: selectedAnswer == "Atlanta"
                  ? (correctAnswer == "Atlanta" ? Colors.green : Colors.red)
                  : Colors.white,
              onTap: () => checkAnswer("Atlanta"),
            ),
            const SizedBox(height: 30.0),
            Options(
              optionText: "London",
              color: selectedAnswer == "London"
                  ? (correctAnswer == "London" ? Colors.green : Colors.red)
                  : Colors.white,
              onTap: () => checkAnswer("London"),
            ),
          ],
        ),
      ),
    );
  }
}
