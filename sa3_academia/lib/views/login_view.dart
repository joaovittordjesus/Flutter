// lib\views\login_view.dart
import 'package:flutter/material.dart';
import 'package:sa3_academia/controllers/login_controller.dart';
import 'package:sa3_academia/views/register_view.dart';
import 'package:sa3_academia/views/exercise_list_view.dart'; // Importe a tela de lista de exercícios

class LoginView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                bool loggedIn = await _loginController.loginUser(
                  context,
                  usernameController.text,
                  passwordController.text,
                );
                if (loggedIn) {
                  // Se o login for bem-sucedido, navegar para a tela de lista de exercícios
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ExerciseListView()), // Navega para a tela de lista de exercícios
                  );
                } else {
                  // Se o login falhar, exibir mensagem de erro
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Login failed. Please check your credentials.'),
                  ));
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Ao pressionar o botão de registro, navegar para a tela de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
