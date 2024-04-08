<<<<<<< HEAD
// Model.dart

// Classe que representa um contato
class ContactModel {
  // Atributos do contato
  int id; // Identificador único do contato
  String name; // Nome do contato
  String email; // Endereço de email do contato
  String phone; // Número de telefone do contato
  String addressLine1; // Endereço do contato

  // Construtor da classe ContactModel
  ContactModel({
    required this.id, // Requer o ID do contato
    required this.name, // Requer o nome do contato
    required this.email, // Requer o email do contato
    required this.phone, // Requer o número de telefone do contato
    required this.addressLine1, // Requer o endereço do contato
  });

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      //'id': id, // O ID é autoincrementado no banco de dados, então não precisa ser definido aqui
      'name': name, // Salva o nome do contato no mapa
      'email': email, // Salva o email do contato no mapa
      'phone': phone, // Salva o telefone do contato no mapa
      'addressLine1': addressLine1, // Salva o endereço do contato no mapa
    };
  }

  // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'], // Obtém o ID do mapa
      name: map['name'], // Obtém o nome do mapa
      email: map['email'], // Obtém o email do mapa
      phone: map['phone'], // Obtém o telefone do mapa
      addressLine1: map['addressLine1'], // Obtém o endereço do mapa
    );
  }
}
=======
class ContatoModel {
  //atributos
  int id;
  String nome;
  String email;
  String telefone;
  String endereco;
  //construtor
  ContatoModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
  });
  //mapeamento 
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
    };
  }
  factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
    );
  }
}
>>>>>>> dde045ff2b247d32c368a85542a438538ccc8728
