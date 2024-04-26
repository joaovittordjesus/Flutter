<<<<<<< HEAD
class UserModel {
=======
// lib\models\user_model.dart
class UserModel {
  int? id; // Adicionando o atributo id
>>>>>>> 8ba65a1796dae57f2acd978c23c4cf3ee080780b
  final String username;
  final String password;

  UserModel({
<<<<<<< HEAD
=======
    this.id, // Atualizando o construtor para aceitar um id opcional
>>>>>>> 8ba65a1796dae57f2acd978c23c4cf3ee080780b
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
<<<<<<< HEAD
=======
      'id': id,
>>>>>>> 8ba65a1796dae57f2acd978c23c4cf3ee080780b
      'username': username,
      'password': password,
    };
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 8ba65a1796dae57f2acd978c23c4cf3ee080780b
