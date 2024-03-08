import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 2"),
        ),
        body: Column(
          children: [
            Container(
              width: 128,
              height: 72,
              color: const Color.fromARGB(255, 184, 33, 243),
              alignment: Alignment.center,
              child: Text("Organização de Column Container"),
            ),
            Image.asset(
              'assets/exemplo_mediaquery/images/will-smith-confia.gif',
              width: 128.0,
              height: 72.0,
              fit: BoxFit.cover,
            ),
            const Row(
              children: [
              Icon(Icons.star), // Corrigido o nome do widget para Icon
              Text('Avaliação: 4.5'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main(){
  runApp(MyApp());
}
