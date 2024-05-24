// Classe que representa um filme.
class Filme {
  // Atributos do filme.
  final String nome; // Nome do filme.
  final String genero; // Gênero ou categoria do filme.
  final String sinopse; // Sinopse do filme.
  final int duracao; // Duração do filme em minutos.
  final int ano; // Ano de lançamento do filme.
  final int classificacao; // Classificação indicativa do filme.
  final List<String> elenco; // Elenco do filme.
  final String imagem; // Caminho da imagem do filme.

  // Construtor da classe Filme.
  Filme({
    required this.nome,
    required this.genero,
    required this.sinopse,
    required this.duracao,
    required this.ano,
    required this.classificacao,
    required this.elenco,
    required this.imagem,
  });

  // Método toJson para converter um objeto Filme em um mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'genero': genero,
      'sinopse': sinopse,
      'duracao': duracao,
      'ano': ano,
      'classificacao': classificacao,
      'elenco': elenco,
      'imagem': imagem,
    };
  }

  // Método factory para criar um objeto Filme a partir de um mapa JSON.
  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      nome: json['nome'], // Obtém o nome do filme do JSON.
      genero: json['genero'], // Obtém o gênero do filme do JSON.
      sinopse: json['sinopse'], // Obtém a sinopse do filme do JSON.
      duracao: json['duracao'], // Obtém a duração do filme do JSON.
      ano: json['ano'], // Obtém o ano do filme do JSON.
      classificacao:
          json['classificacao'], // Obtém a classificação do filme do JSON.
      elenco: json['elenco'], // Obtém o elenco do filme do JSON.
      imagem: json['imagem'], // Obtém o caminho da imagem do filme do JSON.
    );
  }
}
