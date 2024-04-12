// lib\views\login_page.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences_sqlite/controllers/data_base_controller.dart';
import 'package:shared_preferences_sqlite/models/user_model.dart';

class LoginPage extends StatelessWidget {
  final DatabaseController _dbController =
      DatabaseController(); // Instancia o controlador do banco de dados.

  @override
  Widget build(BuildContext context) {
    String email = ''; // Variável para armazenar o email inserido pelo usuário.
    String password =
        ''; // Variável para armazenar a senha inserida pelo usuário.

    return Scaffold(
      // Define a estrutura básica da página com um Scaffold.
      appBar: AppBar(
        // Define a barra de aplicativo com um título 'Login'.
        title: Text('Login'),
      ),
      body: Padding(
        // Adiciona um preenchimento ao redor do conteúdo da página.
        padding: EdgeInsets.all(16.0),
        child: Column(
          // Define uma coluna para organizar os widgets verticalmente.
          mainAxisAlignment: MainAxisAlignment
              .center, // Alinha os widgets ao centro verticalmente.
          children: [
            TextField(
              // Campo de entrada de texto para o email do usuário.
              onChanged: (value) => email =
                  value, // Atualiza a variável 'email' quando o texto é alterado.
              decoration: InputDecoration(
                // Define a decoração para o campo de texto.
                labelText:
                    'Email', // Define o rótulo do campo de texto como 'Email'.
              ),
            ),
            SizedBox(
                height: 16.0), // Adiciona um espaço vertical entre os widgets.
            TextField(
              // Campo de entrada de texto para a senha do usuário.
              onChanged: (value) => password =
                  value, // Atualiza a variável 'password' quando o texto é alterado.
              decoration: InputDecoration(
                // Define a decoração para o campo de texto.
                labelText:
                    'Password', // Define o rótulo do campo de texto como 'Password'.
              ),
              obscureText: true, // Esconde o texto digitado no campo de texto.
            ),
            SizedBox(
                height: 16.0), // Adiciona um espaço vertical entre os widgets.
            ElevatedButton(
              // Define um botão elevado.
              onPressed: () async {
                try {
                  // Implementa a lógica de login aqui
                  UserModel? user = await _dbController.getUserByEmail(
                      email); // Obtém o usuário pelo email fornecido.
                  if (user != null && user.password == password) {
                    // Verifica se o usuário foi encontrado e a senha está correta.
                    // Login bem-sucedido
                  } else {
                    // Credenciais inválidas
                  }
                } catch (e) {
                  // Trata exceções
                  print(e.toString()); // Imprime a exceção ocorrida.
                }
              },
              child: Text('Login'), // Define o texto do botão como 'Login'.
            ),
          ],
        ),
      ),
    );
  }
}
