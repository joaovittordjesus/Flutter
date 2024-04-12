// lib\controllers\data_base_controller.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/user_model.dart';

/// Controlador para operações no banco de dados.
class DatabaseController {
  static const String DATABASE_NAME = 'app_database.db';
  static const String TABLE_NAME = 'users';

  late Database _database;

  /// Inicializa o banco de dados.
  Future<void> initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $TABLE_NAME(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  /// Insere um novo usuário no banco de dados.
  Future<void> insertUser(UserModel user) async {
    await _database.insert(
      TABLE_NAME,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Obtém o usuário com o email fornecido do banco de dados.
  Future<UserModel?> getUserByEmail(String email) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      TABLE_NAME,
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }

  /// Remove o usuário autenticado.
  Future<void> logout() async {
    // Aqui você implementa a lógica para remover o usuário autenticado,
    // seja removendo-o do banco de dados ou limpando os dados de sessão, dependendo da sua implementação de autenticação.
  }
}
