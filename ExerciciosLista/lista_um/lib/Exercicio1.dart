import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:Text("Exercicio 1"),
        ),
        body:Column(
          children:[
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("Container 1"),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("Container 2"),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("Container 3"),
            ),
          ]
        ),
      ),
    );
  }

  

}