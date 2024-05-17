// lib\utils\database_helper.dart
import 'dart:async';
import 'package:path/path.dart';
import 'package:sa3_academia/models/exercise_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sa3_academia/models/user_model.dart';

class DatabaseHelper {
  String colUserId = 'user_id'; // Adicione o atributo colUserId
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String userTable = 'user_table';
  String exerciseTable = 'exercise_table'; // Adicionamos a tabela de exercícios
  String colId = 'id';
  String colUsername = 'username';
  String colPassword = 'password';
  String colExerciseId = 'id'; // Coluna de ID para a tabela de exercícios
  String colExerciseName = 'name'; // Coluna de nome para a tabela de exercícios
  String colExerciseIsCompleted =
      'isCompleted'; // Coluna de conclusão para a tabela de exercícios

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'gym.db');
    var gymDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return gymDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE $userTable (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colUsername TEXT,
        $colPassword TEXT
      )
      ''');

    // Criação da tabela de exercícios
    await db.execute('''
    CREATE TABLE $exerciseTable (
      $colExerciseId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colExerciseName TEXT,
      $colExerciseIsCompleted INTEGER,
      $colUserId INTEGER,  -- Adicionando a coluna userId
      FOREIGN KEY ($colUserId) REFERENCES $userTable($colId)  -- Adicionando uma restrição de chave estrangeira
    )
    ''');
  }

  Future<int> insertUser(UserModel user) async {
    Database db = await this.database;
    return await db.insert(userTable, user.toMap());
  }

  Future<UserModel?> getUser(String username) async {
    Database db = await this.database;
    List<Map<String, dynamic>> maps = await db.query(
      userTable,
      where: '$colUsername = ?',
      whereArgs: [username],
    );
    if (maps.length > 0) {
      return UserModel(
        id: maps[0][colId], // Obtenha o id do usuário do banco de dados
        username: maps[0][colUsername],
        password: maps[0][colPassword],
      );
    }
    return null;
  }

  Future<int> insertExercise(ExerciseModel exercise) async {
    Database db = await this.database;
    return await db.insert(exerciseTable, exercise.toMap());
  }

  Future<int> updateExercise(ExerciseModel exercise) async {
    Database db = await this.database;
    return await db.update(
      exerciseTable,
      exercise.toMap(),
      where: '$colExerciseId = ?',
      whereArgs: [exercise.id],
    );
  }

  Future<int> deleteExercise(int id) async {
    Database db = await this.database;
    return await db.delete(
      exerciseTable,
      where: '$colExerciseId = ?',
      whereArgs: [id],
    );
  }

  Future<List<ExerciseModel>> getExercises() async {
    Database db = await this.database;
    List<Map<String, dynamic>> maps = await db.query(exerciseTable);
    return List.generate(maps.length, (index) {
      return ExerciseModel(
        id: maps[index][colExerciseId],
        name: maps[index][colExerciseName],
        //isCompleted: maps[index][colExerciseIsCompleted] == 1, userId: null,
      );
    });
  }
}
