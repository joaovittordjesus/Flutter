// lib\controllers\exercise_controller.dart
import 'package:sa3_academia/models/exercise_model.dart';
import 'package:sa3_academia/utils/database_helper.dart';

class ExerciseController {
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<List<ExerciseModel>> fetchExercises() async {
    // Obtenha uma instância do banco de dados
    final db = await dbHelper.database;

    // Consulte os exercícios na tabela de exercícios
    final List<Map<String, dynamic>> exerciseMaps = await db.query('exercise_table');

    // Converta a lista de mapas em uma lista de objetos ExerciseModel
    return List.generate(exerciseMaps.length, (i) {
      return ExerciseModel(
        name: exerciseMaps[i]['name'],
        isCompleted: exerciseMaps[i]['is_completed'] == 1 ? true : false,
      );
    });
  }

  Future<void> saveExerciseState(ExerciseModel exercise) async {
    // Obtenha uma instância do banco de dados
    final db = await dbHelper.database;

    // Atualize o estado do exercício no banco de dados
    await db.update(
      'exercise_table',
      {'is_completed': exercise.isCompleted ? 1 : 0},
      where: 'name = ?',
      whereArgs: [exercise.name],
    );
  }
}
