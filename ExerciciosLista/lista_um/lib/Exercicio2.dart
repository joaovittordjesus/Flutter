import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/pi-hole.webp";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercicio 2"),
        ),
        body: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    child: Image.asset(imagePath),
                    width: 200,
                    height: 200,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Icon(Icons.settings),
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("Lorem Ipsum"),
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
