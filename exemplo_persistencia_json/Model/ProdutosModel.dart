class Produto {
  String nome;
  String preco;
  String categoria;

  Produto({required this.categoria, required this.preco, required this.nome});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
    };
  }

  factory Produto.fromJson(Map<String, dynamic> map) {
    return Produto(
      nome: map['nome'],
      preco: map['preco'],
      categoria: map['categoria'],
    );
  }
}
