// lib\controllers\exercise_controller.dart
import 'package:sa3_academia/models/exercise_model.dart';
import 'package:sa3_academia/utils/database_helper.dart';

class ExerciseController {
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<List<ExerciseModel>> fetchExercises() async {
    // Obtenha uma instância do banco de dados
    final db = await dbHelper.database;

    // Defina exerciseTable e os campos de coluna como strings
    String exerciseTable = 'exercise_table';
    String colExerciseId = 'id';
    String colExerciseName = 'name';
    String colExerciseIsCompleted = 'isCompleted';
    String colUserId = 'userId';

    // Consulte os exercícios na tabela de exercícios
    final List<Map<String, dynamic>> exerciseMaps =
        await db.query(exerciseTable);

    // Converta a lista de mapas em uma lista de objetos ExerciseModel
    return List.generate(exerciseMaps.length, (i) {
      return ExerciseModel(
        id: exerciseMaps[i][colExerciseId],
        name: exerciseMaps[i][colExerciseName],
        isCompleted:
            exerciseMaps[i][colExerciseIsCompleted] == 1 ? true : false,
        userId: exerciseMaps[i][colUserId],
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
