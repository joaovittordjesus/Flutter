class UserModel {
  int id;
  String username;
  String password;
  String email;
  String
      theme; // Adicione o campo 'theme' para armazenar as configurações personalizadas do usuário

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.theme,
  });

  // Método para converter um usuário para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'theme': theme,
    };
  }

  // Método de fábrica para criar um objeto UserModel a partir de um mapa (para ler do banco de dados)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      email: map['email'],
      theme: map['theme'],
    );
  }
}
