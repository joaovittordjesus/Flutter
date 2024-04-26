import 'package:flutter/foundation.dart';

class Usuario {
  //atributos
  late int id;
  String nome;
  String email;
  String senha;
  //Construtor
  Usuario(
      {required this.nome,
      required this.email,
      required this.senha,
      required id});

  Map<String, dynamic> toMap() {
    return {
      'u_nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['u_nome'],
      email: map['email'],
      senha: map['senha'],
      id: null,
    );
  }

  //Mapeando os campos da tabela do banco de dados para os atributos do objeto respectivamente.
}
