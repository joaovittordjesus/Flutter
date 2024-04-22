// lib\controllers\login_controller.dart
import 'package:flutter/material.dart';
import 'package:sa3_academia/models/user_model.dart';
import 'package:sa3_academia/utils/database_helper.dart';

class LoginController {
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<bool> loginUser(
      BuildContext context, String username, String password) async {
    // Obtém o usuário do banco de dados pelo nome de usuário
    final user = await dbHelper.getUser(username);
    
    // Verifica se o usuário existe e se a senha está correta
    if (user != null && user.password == password) {
      // Usuário autenticado com sucesso
      return true;
    } else {
      // Credenciais inválidas
      return false;
    }
  }
}
