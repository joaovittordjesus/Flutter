import 'package:exemplo_json/controller/produto_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProdutoController _produtoController = ProdutoController();

  @override
  void initState() {
    _produtoController.loadProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista del Productos")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _produtoController.produtos.length,
              itemBuilder: (context, index) {
                final produto = _produtoController.produtos[index];
                return ListTile(
                  title: Text(produto.nome),
                  subtitle: Text(
                      'Preço: ${produto.valor.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
