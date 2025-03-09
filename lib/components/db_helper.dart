import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = "questions";

  // Initialize Database
  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'quiz_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
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

  // Insert Question
  static Future<int> insertQuestion(Map<String, dynamic> question) async {
    final db = await database;
    return await db.insert(tableName, question);
  }

  // Fetch All Questions
  static Future<List<Map<String, dynamic>>> getAllQuestions() async {
    final db = await database;
    return await db.query(tableName);
  }

  // Fetch Questions by Level
  static Future<List<Map<String, dynamic>>> getQuestionsByLevel(int level) async {
    final db = await database;
    return await db.query(
      tableName,
      where: "level = ?",
      whereArgs: [level],
    );
  }

  // Delete Question by ID
  static Future<int> deleteQuestion(int id) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // Update Question
  static Future<int> updateQuestion(int id, Map<String, dynamic> updatedQuestion) async {
    final db = await database;
    return await db.update(
      tableName,
      updatedQuestion,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // Clear All Questions
  static Future<void> clearDatabase() async {
    final db = await database;
    await db.delete(tableName);
  }
}
