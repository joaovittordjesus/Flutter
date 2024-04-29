import 'package:exemplo_json2/View/produtos_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Produtos Json",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProdutosPage(),
    );
  }
}
