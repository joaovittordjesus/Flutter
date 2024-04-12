// Importações necessárias
import 'package:exemplo_persistencia_sqllite/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:seu_projeto/Model.dart'; // Importe o modelo de usuário

class DataBaseHelper {
  static const String DATABASE_NAME = 'users.db';
  static const String TABLE_NAME = 'users';
  static const String CREATE_USERS_TABLE_SCRIPT =
      'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT, email TEXT, theme TEXT)'; // Adicione o campo 'theme' para armazenar as configurações personalizadas do usuário

  // Método para obter a instância do banco de dados
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_USERS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  // Método para criar um novo usuário no banco de dados
  Future<void> createUser(UserModel user) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NAME, user.toMap());
    } catch (ex) {
      print(ex);
    }
  }

  // Método para verificar as credenciais do usuário durante o login
  Future<UserModel?> loginUser(String username, String password) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> result = await db.query(TABLE_NAME,
          where: 'username = ? AND password = ?',
          whereArgs: [username, password]);
      if (result.isNotEmpty) {
        return UserModel.fromMap(result.first);
      }
    } catch (ex) {
      print(ex);
    }
    return null;
  }

  // Método para atualizar as configurações do usuário
  Future<void> updateUserTheme(int userId, String theme) async {
    try {
      final Database db = await _getDatabase();
      await db.update(TABLE_NAME, {'theme': theme},
          where: 'id = ?', whereArgs: [userId]);
    } catch (ex) {
      print(ex);
    }
  }

  // Método para obter o usuário atualmente logado
  Future<UserModel?> getCurrentUser() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> result = await db
          .rawQuery('SELECT * FROM $TABLE_NAME ORDER BY id DESC LIMIT 1');
      if (result.isNotEmpty) {
        return UserModel.fromMap(result.first);
      }
    } catch (ex) {
      print(ex);
    }
    return null;
  }
}
