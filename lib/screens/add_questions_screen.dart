import 'package:flutter/material.dart';
import 'package:flashcard_quiz1/components/db_helper.dart';

class AddQuestionsScreen extends StatefulWidget {
  @override
  _AddQuestionsScreenState createState() => _AddQuestionsScreenState();
}

class _AddQuestionsScreenState extends State<AddQuestionsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  String? _correctOption;
  int _selectedLevel = 1; // Default level

  void _saveQuestion() async {
    if (_formKey.currentState!.validate() && _correctOption != null) {
      Map<String, dynamic> newQuestion = {
        'question': _questionController.text,
        'option1': _option1Controller.text,
        'option2': _option2Controller.text,
        'option3': _option3Controller.text,
        'correctOption': _correctOption,
        'level': _selectedLevel,
      };

      await DatabaseHelper.insertQuestion(newQuestion);

      // Clear fields after adding a question
      _questionController.clear();
      _option1Controller.clear();
      _option2Controller.clear();
      _option3Controller.clear();
      setState(() {
        _correctOption = null;
        _selectedLevel = 1;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Question added successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select the correct answer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Question')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _questionController,
                decoration: InputDecoration(labelText: 'Enter Question'),
                validator: (value) => value!.isEmpty ? 'Question cannot be empty' : null,
              ),
              TextFormField(
                controller: _option1Controller,
                decoration: InputDecoration(labelText: 'Option 1'),
                validator: (value) => value!.isEmpty ? 'Option cannot be empty' : null,
              ),
              TextFormField(
                controller: _option2Controller,
                decoration: InputDecoration(labelText: 'Option 2'),
                validator: (value) => value!.isEmpty ? 'Option cannot be empty' : null,
              ),
              TextFormField(
                controller: _option3Controller,
                decoration: InputDecoration(labelText: 'Option 3'),
                validator: (value) => value!.isEmpty ? 'Option cannot be empty' : null,
              ),
              SizedBox(height: 10),

              // Select Correct Answer
              Text('Select Correct Answer:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Column(
                children: ['option1', 'option2', 'option3'].map((option) {
                  return RadioListTile<String>(
                    title: Text(option.replaceAll('option', 'Option ')),
                    value: option,
                    groupValue: _correctOption,
                    onChanged: (value) {
                      setState(() {
                        _correctOption = value;
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 10),

              // Select Level
              Text('Select Difficulty Level:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButton<int>(
                value: _selectedLevel,
                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value!;
                  });
                },
                items: [
                  DropdownMenuItem(value: 1, child: Text('Level 1 - Easy')),
                  DropdownMenuItem(value: 2, child: Text('Level 2 - Medium')),
                  DropdownMenuItem(value: 3, child: Text('Level 3 - Hard')),
                ],
              ),

              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveQuestion,
                  child: Text('Save Question'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
