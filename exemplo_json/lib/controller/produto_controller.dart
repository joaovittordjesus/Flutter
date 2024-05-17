import 'dart:convert';

import 'package:exemplo_json/model/produtos_model.dart';
import 'package:flutter/services.dart';

class ProdutoController {
  //Atributos
  //Lista de produtos privada
  List<Produto> _produtos = [];

  //Metodo get publico para retornar produtos da lista de produtos
  List<Produto> get produtos => _produtos;

  //Codificando e descodificando o json
  // Método para carregar produtos do arquivo JSON
  Future<void> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    //limpando lista
    _produtos.clear();
    // Converte os objetos  da lista dynamicJSON em
    //instâncias de Produto e adiciona à lista de produtos
    _produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
  }
}
