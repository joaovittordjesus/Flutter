// lib\views\exercise_list_view.dart
import 'package:flutter/material.dart';
import 'package:sa3_academia/controllers/exercise_controller.dart';
import 'package:sa3_academia/models/exercise_model.dart';

class ExerciseListView extends StatefulWidget {
  @override
  _ExerciseListViewState createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView> {
  final ExerciseController _exerciseController = ExerciseController();
  late List<ExerciseModel> exercises = []; // Inicializando como uma lista vazia

  @override
  void initState() {
    super.initState();
    // Chamamos a função assíncrona para buscar os exercícios do banco de dados
    _loadExercises();
  }

  // Função assíncrona para carregar os exercícios do banco de dados
  _loadExercises() async {
    // Chamamos o método assíncrono fetchExercises do ExerciseController
    List<ExerciseModel> fetchedExercises = await _exerciseController.fetchExercises();
    setState(() {
      // Atualizamos o estado com os exercícios recuperados do banco de dados
      exercises = fetchedExercises;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return ListTile(
            title: Text(exercise.name),
            trailing: Checkbox(
              value: exercise.isCompleted,
              onChanged: (value) {
                setState(() {
                  // Atualizamos o estado do exercício com o novo valor do checkbox
                  exercise.isCompleted = value!;
                  // Chamamos uma função assíncrona para salvar o estado atualizado do exercício no banco de dados
                  _exerciseController.saveExerciseState(exercise);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
