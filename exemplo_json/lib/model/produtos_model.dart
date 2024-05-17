class Produto {
  final String nome;
  final double valor;
  final String categoria;

  //Construtor
  Produto({required this.nome, required this.valor, required this.categoria});

  //Métodos

  //Serealizando para jogar ao json
  Map<String, dynamic> toJson() {
    return {'nome': nome, 'valor': valor, 'categoria': categoria};
  }

  //Descerealizar para jogar no Objeto
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        nome: json['nome'], valor: json['valor'], categoria: json['categoria']);
  }
}
