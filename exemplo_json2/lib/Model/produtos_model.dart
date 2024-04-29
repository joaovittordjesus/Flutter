class Produto {
  //Atributos
  final String nome;
  final int preco;
  final String categoria;
  final String foto;

  //Construtor
  const Produto(
      {required this.nome,
      required this.preco,
      required this.categoria,
      required this.foto});

  //Metodos
  //Lista de chave e valor que mapeia para o banco de dados, neste caso o produtos.json.
  Map<String, dynamic> toJson() {
    return {'nome': nome, 'preco': preco, 'categoria': categoria, foto: 'foto'};
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        nome: json['nome'],
        preco: json['preco'],
        categoria: json['categoria'],
        foto: json['foto']);
  }
}
