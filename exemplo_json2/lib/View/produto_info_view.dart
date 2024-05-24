import 'package:exemplo_json2/Model/produtos_model.dart';
import 'package:flutter/material.dart';

class ProdutoInfoPage extends StatelessWidget {
  Produto produto;

  ProdutoInfoPage({/*super.key,*/ required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto Info"),
      ),
      body: Center(
        child: Column(children: [
          Text(produto.foto),
          Text(produto.nome),
          Text("${produto.preco}"),
          Text(produto.categoria)
        ]),
      ),
    );
  }
}
