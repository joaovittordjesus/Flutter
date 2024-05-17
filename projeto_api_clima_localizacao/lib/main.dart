import 'package:flutter/material.dart';
import 'package:projeto_api_clima_localizacao/View/citydetail_screen.dart';
import 'package:projeto_api_clima_localizacao/View/favorites_screen.dart';
import 'package:projeto_api_clima_localizacao/View/home_screen.dart';
import 'package:projeto_api_clima_localizacao/View/search_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Clima",
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        'search': (context) => SearchScreen(),
        '/favorites': (context) => FavoriteScreen(),
        '/details_city': (context) => CityDetailsScreen(city)
      },
    );
  }
}
