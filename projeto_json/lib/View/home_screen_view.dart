import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter.

// Tela inicial da aplicação.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mundo do Cinema'), // Título da barra de navegação.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botão para navegar para a lista de filmes.
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context,
                    "/list"), // Navega para a rota "/list" ao ser pressionado.
                child: Text("Lista de Filmes")), // Texto do botão.
            SizedBox(
              height: 20,
            ), // Espaçamento entre os botões.
            // Botão para navegar para a tela de cadastro de filmes.
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context,
                    "/cadastro"), // Navega para a rota "/cadastro" ao ser pressionado.
                child: Text("Cadastro de Filmes")), // Texto do botão.
          ],
        ),
      ),
    );
  }
}
