import 'package:provider/provider.dart';
import 'package:to_do_list/tarefaController.dart';
import 'package:to_do_list/tarefaView.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class ListaTarefaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //definindo a tela inicial como a ListaTarefaScreen e utilizando o provider
        home: ChangeNotifierProvider(
      create: (context) => ListaTarefasController(),
      child: ListaTarefasScreen(),
    ));
  }
}
