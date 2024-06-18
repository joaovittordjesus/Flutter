// Importa o pacote Flutter Material para usar os widgets padrão do Material Design
import 'package:flutter/material.dart';

// Importa o widget CityDetailsScreen do arquivo citydetail_screen.dart
import 'package:projeto_api_clima_localizacao/View/citydetail_screen.dart';

// Importa os widgets de outras telas
import 'View/favorites_screen.dart';
import 'View/home_screen.dart';
import 'View/search_screen.dart';

// Função principal que inicia o aplicativo
void main(List<String> args) {
  runApp(const MyApp());
}

// Define o widget MyApp que é um StatelessWidget (não possui estado mutável)
class MyApp extends StatelessWidget {
  // Construtor padrão do widget MyApp
  const MyApp({super.key});

  // Constrói a interface do usuário
  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp que configura o tema e as rotas do aplicativo
    return MaterialApp(
      title: "Projeto Clima", // Título do aplicativo
      home: HomeScreen(), // Define a tela inicial do aplicativo
      routes: {
        // Define as rotas nomeadas para navegação entre telas
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoriteScreen(),
      },
    );
  }
}
