import 'package:flutter/material.dart';
import 'package:seu_projeto/DataBaseController.dart';
import 'package:seu_projeto/Model.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final DataBaseHelper _dbHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                // Realizar a autenticação do usuário
                final UserModel? user = await _dbHelper.loginUser(
                  _usernameController.text,
                  _passwordController.text,
                );
                if (user != null) {
                  // Navegar para a próxima página após o login bem-sucedido
                  Navigator.pushReplacementNamed(context, '/settings');
                } else {
                  // Exibir mensagem de erro se as credenciais forem inválidas
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid username or password')),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final DataBaseHelper _dbHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Criar um novo usuário
                final UserModel newUser = UserModel(
                  id: 0, // O ID será gerado automaticamente pelo banco de dados
                  username: _usernameController.text,
                  password: _passwordController.text,
                  email: _emailController.text,
                  theme: 'default', // Define o tema padrão para o novo usuário
                );
                await _dbHelper.createUser(newUser);
                // Navegar de volta para a tela de login após o registro bem-sucedido
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final DataBaseHelper _dbHelper = DataBaseHelper();
  final TextEditingController _themeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _themeController,
              decoration: InputDecoration(labelText: 'Theme'),
            ),
            ElevatedButton(
              onPressed: () async {
                final UserModel? currentUser = await _dbHelper
                    .getCurrentUser(); // Implemente este método no DataBaseController.dart
                if (currentUser != null) {
                  await _dbHelper.updateUserTheme(
                      currentUser.id, _themeController.text);
                  // Aplicar o tema atualizado
                  // Implemente esta funcionalidade conforme necessário para aplicar o tema personalizado
                }
              },
              child: Text('Save Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
