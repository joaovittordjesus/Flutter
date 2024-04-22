// lib\models\user_model.dart
class UserModel {
  int? id; // Adicionando o atributo id
  final String username;
  final String password;

  UserModel({
    this.id, // Atualizando o construtor para aceitar um id opcional
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }
}
