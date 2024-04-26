<<<<<<< HEAD
class ExerciseModel {
  final String name;
  bool isCompleted;

  ExerciseModel({
    required this.name,
    this.isCompleted = false});
}
=======
// lib\models\exercise_model.dart
import 'package:flutter/material.dart';

class ExerciseModel {
  int? id;
  String name;
  bool isCompleted;
  int? userId; // Adicionando o atributo userId

  ExerciseModel({
    this.id,
    required this.name,
    this.isCompleted = false,
    this.userId, // Atualizando o construtor para incluir userId
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted ? 1 : 0,
      'userId': userId, // Adicionando userId ao mapeamento
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      id: map['id'],
      name: map['name'],
      isCompleted: map['isCompleted'] == 1,
      userId: map['userId'], // Adicionando userId ao construtor
    );
  }
}
>>>>>>> 8ba65a1796dae57f2acd978c23c4cf3ee080780b
