import 'package:flashcard_quiz1/components/cross_icon.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/options.dart';
import 'dart:async';

class level_1_question extends StatefulWidget {
  const level_1_question({super.key});

  @override
  State<level_1_question> createState() => _level_1_questionState();
}

class _level_1_questionState extends State<level_1_question> {
  int currentQuestion = 5;
  String correctAnswer = "Paris";
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
            Color(0xFFEF729E),
            Color(0xFFEF729E),
            Color(0xFFED896D),
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
            Image.asset("images/starting.png"),
            Text(
              "Question $currentQuestion of 10",
              style: const TextStyle(
                  color: Color(0xFFFFFFE6),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              "Q: What is the capital of France?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            Options(
              optionText: "Berlin",
              color: selectedAnswer == "Berlin"
                  ? (correctAnswer == "Berlin" ? Colors.green : Colors.red)
                  : Colors.white,
              onTap: () => checkAnswer("Berlin"),
            ),
            const SizedBox(height: 30.0),
            Options(
              optionText: "Madrid",
              color: selectedAnswer == "Madrid"
                  ? (correctAnswer == "Madrid" ? Colors.green : Colors.red)
                  : Colors.white,
              onTap: () => checkAnswer("Madrid"),
            ),
            const SizedBox(height: 30.0),
            Options(
              optionText: "Paris",
              color: selectedAnswer == "Paris"
                  ? (correctAnswer == "Paris" ? Colors.green : Colors.red)
                  : Colors.white,
              onTap: () => checkAnswer("Paris"),
            ),
          ],
        ),
      ),
    );
  }
}
