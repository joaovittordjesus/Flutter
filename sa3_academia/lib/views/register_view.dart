// lib\views\register_view.dart
import 'package:flutter/material.dart';
import 'package:sa3_academia/controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RegisterController _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                // Chamamos o método registerUser do RegisterController para registrar um novo usuário
                bool registered = await _registerController.registerUser(
                  context,
                  usernameController.text,
                  passwordController.text,
                );
                if (registered) {
                  // Se o registro for bem-sucedido, navegamos de volta para a tela de login
                  Navigator.pop(context);
                } else {
                  // Se o registro falhar, exibimos uma mensagem de erro
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Registration failed. Username already in use.'),
                  ));
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
