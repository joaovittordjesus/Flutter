// lib\controllers\register_controller.dart
import 'package:flutter/material.dart';
import 'package:sa3_academia/models/exercise_model.dart';
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
      int userId = await dbHelper.insertUser(newUser);

      // Insere o novo usuário no banco de dados
      await dbHelper.insertUser(newUser);

      //Criando uma lista de exercícios padrão ao registrar o usuário
      await _insertDefaultExercisesForUser(newUser);

      // Retorna true indicando que o registro foi bem-sucedido
      return true;
    } else {
      // Retorna false indicando que o nome de usuário já está em uso
      return false;
    }
  }

  Future<void> _insertDefaultExercisesForUser(UserModel user) async {
    List<ExerciseModel> defaultExercises = _createDefaultExercises();
    for (ExerciseModel exercise in defaultExercises) {
      // Associe corretamente o id do usuário aos exercícios
      exercise.userId = user.id;
      await dbHelper.insertExercise(exercise);
    }
  }

  List<ExerciseModel> _createDefaultExercises() {
    //Cria uma lista de exercícios padrão
    List<ExerciseModel> defaultExercises = [];
    defaultExercises.add(ExerciseModel(name: "Exercise 1:"));
    defaultExercises.add(ExerciseModel(name: "Exercise 2:"));
    defaultExercises.add(ExerciseModel(name: "Exercise 3:"));
    defaultExercises.add(ExerciseModel(name: "Exercise 4:"));
    defaultExercises.add(ExerciseModel(name: "Exercise 5:"));
    defaultExercises.add(ExerciseModel(name: "Exercise 6:"));
    return defaultExercises;
  }
}
