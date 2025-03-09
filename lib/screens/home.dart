import 'package:flashcard_quiz1/screens/continuing.dart';
import 'package:flashcard_quiz1/screens/add_questions_screen.dart';
import 'package:flashcard_quiz1/screens/destination.dart';
import 'package:flashcard_quiz1/screens/starting.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/level_card.dart';
import 'package:flashcard_quiz1/components/heart_icon.dart';
import 'package:flashcard_quiz1/components/person_icon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlashCard Quiz"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Prevents overflow
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [heart_icon(), SizedBox(width: 10.0), person_icon()],
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Let's Play",
                style: TextStyle(
                  color: Color(0xFFF35E7A),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Be the first!",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Starting()),
                      );
                    },
                    child: const level_card(
                      levelText: "Level 1",
                      titleText: "Travel newbie",
                      image: "images/travel_bag.png",
                      icon: Icons.done,
                      color1: Color(0xFFEF729E),
                      color2: Color(0xFFEC7C86),
                      color3: Color(0xFFED896D),
                      image_height: 180.0,
                      image_width: 180.0,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Continuing(),
                        ),
                      );
                    },
                    child: const level_card(
                      levelText: "Level 2",
                      titleText: "Continuing",
                      icon: Icons.play_arrow,
                      image: "images/balloon_color.png",
                      color1: Color(0xFF5174ED),
                      color2: Color(0xFF2F95F4),
                      color3: Color(0xFF0BB7FC),
                      image_height: 180.0,
                      image_width: 180.0,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Destination()),
                      );
                    },
                    child: const level_card(
                      levelText: "Level 3",
                      titleText: "Experienced",
                      icon: Icons.lock,
                      image: "images/destination.png",
                      color1: Color(0xFFA58ED2),
                      color2: Color(0xFFCFA7DD),
                      color3: Color(0xFFF6BFEA),
                      image_height: 180,
                      image_width: 180,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),

              // 🔹 Add Question Button (Centered)
              Center(
                child: SizedBox(
                  width:
                      MediaQuery.of(context).size.width *
                      0.8, // Responsive width
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddQuestionScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      "Add Question",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5177EE),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Ensure spacing before bottom of screen
            ],
          ),
        ),
      ),
    );
  }
}
