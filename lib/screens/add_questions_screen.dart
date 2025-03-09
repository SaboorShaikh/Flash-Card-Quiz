import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/db_helper.dart';
import 'package:flashcard_quiz1/components/cross_icon.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  final TextEditingController _correctOptionController = TextEditingController();
  int _selectedLevel = 1;

  void _saveQuestion() async {
    String question = _questionController.text.trim();
    String option1 = _option1Controller.text.trim();
    String option2 = _option2Controller.text.trim();
    String option3 = _option3Controller.text.trim();
    String correctOption = _correctOptionController.text.trim();

    if (question.isEmpty ||
        option1.isEmpty ||
        option2.isEmpty ||
        option3.isEmpty ||
        correctOption.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    await DatabaseHelper.insertQuestion(
        question, option1, option2, option3, correctOption, _selectedLevel);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Question added successfully!")),
    );

    // Clear input fields after saving
    _questionController.clear();
    _option1Controller.clear();
    _option2Controller.clear();
    _option3Controller.clear();
    _correctOptionController.clear();
  }

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
            // Top Row with back button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const cross_icon(),
                ),
                const Text(
                  "Add Question",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 40), // Placeholder for symmetry
              ],
            ),
            const SizedBox(height: 30.0),

            // Question input field
            buildTextField("Enter Question", _questionController),

            const SizedBox(height: 20.0),
            const Text(
              "Options",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),

            // Options input fields
            buildTextField("Option 1", _option1Controller),
            buildTextField("Option 2", _option2Controller),
            buildTextField("Option 3", _option3Controller),
            buildTextField("Correct Option", _correctOptionController),

            const SizedBox(height: 20.0),
            const Text(
              "Select Level",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),

            // Level selection dropdown
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<int>(
                value: _selectedLevel,
                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value!;
                  });
                },
                items: [1, 2, 3].map((level) {
                  return DropdownMenuItem<int>(
                    value: level,
                    child: Text(
                      "Level $level",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                isExpanded: true,
                underline: const SizedBox(),
              ),
            ),

            const SizedBox(height: 40.0),

            // Save button
            GestureDetector(
              onTap: _saveQuestion,
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(2, 4),
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Save Question",
                    style: TextStyle(
                      color: Color(0xFF5177EE),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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

  // Custom Input Field
  Widget buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
