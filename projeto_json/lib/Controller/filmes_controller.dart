import 'dart:convert'; // Importa a biblioteca para trabalhar com JSON.
import 'dart:io'; // Importa a biblioteca para operações de entrada e saída.
import 'package:path_provider/path_provider.dart'; // Importa o pacote para obter o diretório de aplicativos.
import 'package:projeto_json/Model/filme_model.dart'; // Importa o modelo de filme.

// Classe responsável por controlar os filmes.
class FilmesController {
  // Atributo para armazenar a lista de filmes.
  List<Filme> _listFilmes = [];

  // Getter para acessar a lista de filmes.

  List<Filme> get listFilmes => _listFilmes;

  // Método para salvar os filmes em formato JSON.
  Future<void> saveFilmestoJson() async {
    // Obtém o diretório de documentos do aplicativo.
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;

    // Cria o arquivo JSON.
    final file = File('$path/filmes.json');

    // Converte a lista de filmes para uma lista de JSON e a escreve no arquivo.
    final jsonList = _listFilmes.map((filme) => filme.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }

  // Método para carregar os filmes a partir de um arquivo JSON.
  Future<List<Filme>> loadFilmesfromJson() async {
    try {
      // Obtém o diretório de documentos do aplicativo.
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String path = appDocDir.path;

      // Abre o arquivo JSON.
      final file = File('$path/filmes.json');

      // Lê o conteúdo do arquivo e decodifica o JSON.
      final jsonList = jsonDecode(await file.readAsString());

      // Converte o JSON de volta para objetos Filme e os armazena na lista de filmes.
      _listFilmes =
          jsonList.map<Filme>((json) => Filme.fromJson(json)).toList();
    } catch (e) {
      // Em caso de erro, limpa a lista de filmes.
      _listFilmes = [];
    }

    return _listFilmes;
  }

  // Método para adicionar um filme à lista.
  void addFilme(Filme filme) {
    _listFilmes.add(filme); // Adiciona o filme à lista.
    saveFilmestoJson(); // Salva a lista atualizada em formato JSON.
  }
}
