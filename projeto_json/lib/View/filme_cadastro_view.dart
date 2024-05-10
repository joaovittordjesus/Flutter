import 'dart:io'; // Importa a biblioteca para operações de entrada e saída.

import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter.
import 'package:image_picker/image_picker.dart'; // Importa o pacote para selecionar imagens.
import 'package:projeto_json/Controller/filmes_controller.dart'; // Importa o controlador de filmes.

import '../Model/filme_model.dart'; // Importa o modelo de filme.

// Classe que representa a tela de cadastro de filmes.
class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

// Estado da tela de cadastro de filmes.
class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
  // Chave global para o formulário.
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Controladores de texto para os campos do formulário.
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classificacaoController =
      TextEditingController();
  final TextEditingController _elencoController = TextEditingController();

  // Variável para armazenar a imagem selecionada.
  File? _imagemSelecionada;

  // Instância do controlador de filmes.
  FilmesController _controller = new FilmesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Filme'), // Título da tela.
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey, // Chave do formulário para validação.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Campo de texto para o nome do filme.
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Nome do Filme"),
                      controller: _nomeController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Nome do Filme deve ser Preenchido";
                        } else {
                          return null;
                        }
                      }),
                  // Outros campos de texto para gênero, sinopse, duração, ano, classificação e elenco do filme.
                  // Cada campo tem sua própria validação de dados.

                  // Exibição da imagem selecionada, se houver.
                  _imagemSelecionada != null
                      ? Image.file(
                          _imagemSelecionada!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : SizedBox.shrink(),
                  // Botão para selecionar uma imagem do filme.
                  ElevatedButton(
                    onPressed: _tirarFoto,
                    child: Text('Selecione Imagem do Filme'),
                  ),
                  // Botão para cadastrar o filme.
                  ElevatedButton(
                    onPressed: () => {
                      if (_formkey.currentState!.validate()) {_cadastrarFilme()}
                    },
                    child: const Text("Cadastrar"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Função assíncrona para selecionar uma imagem da galeria.
  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagemSelecionada = File(pickedFile.path);
      });
    }
  }

  // Função para obter os detalhes do filme com base nos dados do formulário.
  Filme getfilmes() {
    return Filme(
      nome: _nomeController.text,
      genero: _generoController.text,
      sinopse: _sinopseController.text,
      duracao: int.parse(_duracaoController.text),
      ano: int.parse(_anoController.text),
      classificacao: int.parse(_classificacaoController.text),
      imagem: _imagemSelecionada!.path,
      elenco: List.from(_elencoController.text.split(',')),
    );
  }

  // Função para cadastrar o filme.
  void _cadastrarFilme() {
    _controller.saveFilmestoJson(); // Carrega os filmes do JSON.
    // Adiciona o filme à lista.
    _controller.addFilme(getfilmes());
    // Exibe uma snackbar de sucesso.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filme Cadastrado com Sucesso'),
        duration: Duration(seconds: 2),
      ),
    );
    // Limpa os campos do formulário após o cadastro.
    _limpar();
  }

  // Função para limpar os campos do formulário.
  void _limpar() {
    _nomeController.clear();
    _generoController.clear();
    _sinopseController.clear();
    _duracaoController.clear();
    _anoController.clear();
    _classificacaoController.clear();
    _elencoController.clear();
    _imagemSelecionada = null;
    setState(() {});
  }
}
