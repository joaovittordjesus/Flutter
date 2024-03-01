import 'package:flutter/material.dart';

class Item {
  String nome;
  bool comprado;

  Item(this.nome, this.comprado);
}
//Iniciando a lista de itens de compra.
class ListaComprasModel extends ChangeNotifier {
  List<Item> _itens = [];

  List<Item> get itens => _itens;

  //Método para adicionar um item verificando se ele jão não existe ou se é vazios
  void adicionarItem(String nome) {
    if (nome.trim().isEmpty) {
      throw 'Nome do item não pode ser vazio!';
    }
    
    if (_itens.any((item) => item.nome == nome)) {
      throw 'Item já existe na lista!';
    }

    _itens.add(Item(nome, false));
    notifyListeners();
  }

  //Método para remover um item selecionado
  void removerItem(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens.removeAt(indice);
      notifyListeners();
    }
  }
  //Método para marcar o item como comprado (0/1)
  void marcarComoComprado(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].comprado = !_itens[indice].comprado;
      notifyListeners();
    }
  }
  //Método para editar um item com uma caixa de edição de texto
  void editarItem(int indice, String novoNome) {
    if (indice >= 0 && indice < _itens.length) {
      if (novoNome.trim().isEmpty) {
        throw 'Nome do item não pode ser vazio!';
      }
      _itens[indice].nome = novoNome;
      notifyListeners();
    }
  }
}
