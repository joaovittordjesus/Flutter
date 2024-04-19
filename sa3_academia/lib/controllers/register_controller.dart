// lib\controllers\register_controller.dart
import 'package:flutter/material.dart';
import 'package:sa3_academia/models/user_model.dart';
import 'package:sa3_academia/utils/database_helper.dart';

class RegisterController {
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<bool> registerUser(
      BuildContext context, String username, String password) async {
    // Verifica se já existe um usuário com o mesmo nome de usuário
    final existingUser = await dbHelper.getUser(username);
    
    // Se não existir um usuário com o mesmo nome de usuário, podemos registrar o novo usuário
    if (existingUser == null) {
      // Cria um novo objeto UserModel com o nome de usuário e senha fornecidos
      UserModel newUser = UserModel(username: username, password: password);
      
      // Insere o novo usuário no banco de dados
      await dbHelper.insertUser(newUser);
      
      // Retorna true indicando que o registro foi bem-sucedido
      return true;
    } else {
      // Retorna false indicando que o nome de usuário já está em uso
      return false;
    }
  }
}
