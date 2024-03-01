import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ListaComprasController.dart';
import 'ListaComprasView.dart';

class ListaComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ListaComprasModel(),
        child: ListaComprasScreen(),
      ),
    );
  }
}

void main() {
  runApp(ListaComprasApp());
}
