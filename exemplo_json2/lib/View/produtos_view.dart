import 'package:exemplo_json2/Controller/produtos_controller.dart';
import 'package:exemplo_json2/View/produto_info_view.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  ProdutosController controller = new ProdutosController();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Lista de Produtos'),
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(12),
  //       child: Expanded(
  //         //Rodar lista e contruir a lista aqui
  //         child: FutureBuilder(
  //           future: controller.loadProdutos(),
  //           builder: (context, snapshot) {
  //             if (controller.produtos.isEmpty ) {
  //               return ListView.builder(
  //                 itemCount: controller.produtos.length,
  //                 itemBuilder: (context, index) {
  //                   return ListTile(
  //                     title: Text(controller.produtos[index].nome),
  //                     subtitle: Text(controller.produtos[index].categoria),
  //                     onTap: () => Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => ProdutoInfoPage(
  //                                 produto: controller.produtos[index]))),
  //                   );
  //                 },
  //               );
  //             } else {
  //               return Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //             }
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: FutureBuilder(
          future: controller.loadProdutos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.produtos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.produtos[index].nome),
                    subtitle: Text(controller.produtos[index].categoria),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdutoInfoPage(
                          produto: controller.produtos[index],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
