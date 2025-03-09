import 'package:flashcard_quiz1/components/cross_icon.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/options.dart';
import 'package:flashcard_quiz1/components/db_helper.dart';
import 'dart:async';

class level_3_question extends StatefulWidget {
  const level_3_question({super.key});

  @override
  State<level_3_question> createState() => _level_3_questionState();
}

class _level_3_questionState extends State<level_3_question> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    List<Map<String, dynamic>> fetchedQuestions =
    await DatabaseHelper.getQuestionsByLevel(3);
    setState(() {
      questions = fetchedQuestions;
    });
  }

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          selectedAnswer = null;
        } else {
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    var currentQuestion = questions[currentQuestionIndex];
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
                    "${currentQuestionIndex + 1}",
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
            const SizedBox(height: 30.0),
            Text(
              "Question ${currentQuestionIndex + 1} of ${questions.length}",
              style: const TextStyle(
                  color: Color(0xFFFFFFE6),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30.0),
            Text(
              "Q: ${currentQuestion['question']}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ...['option1', 'option2', 'option3'].map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Options(
                  optionText: currentQuestion[option],
                  color: selectedAnswer == currentQuestion[option]
                      ? (currentQuestion['correctOption'] == option
                      ? Colors.green
                      : Colors.red)
                      : Colors.transparent, // Changed to match background
                  onTap: () => checkAnswer(currentQuestion[option]),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
