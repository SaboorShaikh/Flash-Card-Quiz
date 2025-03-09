import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'quiz.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE questions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            question TEXT,
            option1 TEXT,
            option2 TEXT,
            option3 TEXT,
            correctOption TEXT,
            level INTEGER
          )
        ''');
      },
    );
  }

  static Future<int> insertQuestion(String question, String option1, String option2, String option3, String correctOption, int level) async {
    final db = await database;
    return await db.insert(
      'questions',
      {
        'question': question,
        'option1': option1,
        'option2': option2,
        'option3': option3,
        'correctOption': correctOption,
        'level': level,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getQuestions(int level) async {
    final db = await database;
    return await db.query('questions', where: 'level = ?', whereArgs: [level]);
  }
}
