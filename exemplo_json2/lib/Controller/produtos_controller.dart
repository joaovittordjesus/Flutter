import 'dart:convert';

import 'package:exemplo_json2/Model/produtos_model.dart';
import 'package:flutter/services.dart';

class ProdutosController {
  //Atributos
  List<Produto> produtos = [];

  //Metodos
  Future<List<Produto>> loadProdutos() async {
    //Carregando os dados do arquivo
    final data = await rootBundle.loadString('assets/produtos.json');
    //Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    //Limpa a lista atual de produtos
    produtos.clear();
    //Converte os objetos JSON em instâncias de Produto e adiciona à lista
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
    return produtos;
  }
}
