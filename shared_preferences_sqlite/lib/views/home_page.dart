// lib\views\home_page.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences_sqlite/controllers/data_base_controller.dart';

class HomePage extends StatelessWidget {
  final DatabaseController _dbController =
      DatabaseController(); // Instancia o controlador do banco de dados.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a estrutura básica da página com um Scaffold.
      appBar: AppBar(
        // Define a barra de aplicativo com um título 'Home'.
        title: Text('Home'),
      ),
      body: Center(
        // Centraliza o conteúdo da página verticalmente e horizontalmente.
        child: Column(
          // Define uma coluna para organizar os widgets verticalmente.
          mainAxisAlignment: MainAxisAlignment
              .center, // Alinha os widgets ao centro verticalmente.
          children: [
            Text(
                'Welcome to the Home Page!'), // Exibe uma mensagem de boas-vindas.
            ElevatedButton(
              // Define um botão elevado.
              onPressed: () async {
                await _dbController
                    .logout(); // Chama o método de logout do controlador do banco de dados.
                // Redirecione para a página de login ou faça qualquer outra ação necessária após o logout.
              },
              child: Text('Logout'), // Define o texto do botão como 'Logout'.
            ),
          ],
        ),
      ),
    );
  }
}
