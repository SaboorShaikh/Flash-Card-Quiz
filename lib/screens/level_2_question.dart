import 'package:flashcard_quiz1/components/cross_icon.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/options.dart';

class level_2_question extends StatefulWidget {
  const level_2_question({super.key});

  @override
  State<level_2_question> createState() => _level_2_questionState();
}

class _level_2_questionState extends State<level_2_question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF348EF2),
            Color(0xFF4183F1),
            Color(0xFF5177EE),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
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
                  child: const Text(
                    "01",
                    style: TextStyle(
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
            const SizedBox(
              height: 30.0,
            ),
            Image.asset("images/ship.png"),
            const Text(
              "Question 5 of 10",
              style: TextStyle(
                  color: Color(0xFFFFFFE6),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              "Q: in which city of Germany is the largest port?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            const options(optionText: "Bremen"),
            const SizedBox(height: 30.0),
            const options(optionText: "Hamburg"),
            const SizedBox(height: 30.0),
            const options(optionText: "Hesse"),
          ],
        ),
      ),
    );
  }
}
