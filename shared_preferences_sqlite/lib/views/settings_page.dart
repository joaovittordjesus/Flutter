// lib\views\settings_page.dart

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a estrutura básica da página com um Scaffold.
      appBar: AppBar(
        // Define a barra de aplicativo com um título 'Settings'.
        title: Text('Settings'),
      ),
      body: Center(
        // Centraliza o conteúdo da página na tela.
        child: Text(
            'Settings Page'), // Exibe o texto 'Settings Page' no centro da tela.
      ),
    );
  }
}
