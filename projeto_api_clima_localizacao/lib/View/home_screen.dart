// Importa o pacote Flutter Material para usar os widgets padrão do Material Design
import 'package:flutter/material.dart';

// Importa o pacote Geolocator para obter a localização do dispositivo
import 'package:geolocator/geolocator.dart';

// Importa o controlador WeatherController do arquivo weather_controller.dart
import '../Controller/weather_controller.dart';

// Define o widget HomeScreen que é um StatefulWidget (pode ter estado mutável)
class HomeScreen extends StatefulWidget {
  // Construtor padrão do widget HomeScreen
  const HomeScreen({super.key});

  // Cria o estado para o widget HomeScreen
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Define a classe de estado _HomeScreenState para o widget HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  // Cria uma instância do WeatherController
  WeatherController _controller = new WeatherController();

  // Método initState que é chamado quando o objeto de estado é inserido na árvore
  @override
  void initState() {
    super.initState();
    _getWeather(); // Chama o método _getWeather para obter o clima quando o estado é inicializado
  }

  // Método assíncrono para obter o clima baseado na localização atual do dispositivo
  Future<void> _getWeather() async {
    try {
      // Obtém a posição atual do dispositivo
      Position _locator = await Geolocator.getCurrentPosition();
      print(_locator.latitude); // Imprime a latitude no console
      // Obtém o clima para a localização atual
      _controller.getFromWeatherServiceLocation(
          _locator.latitude, _locator.longitude);
      setState(
          () {}); // Atualiza o estado para reconstruir a interface do usuário
    } catch (e) {
      print(e); // Imprime o erro no console se houver uma exceção
    }
  }

  // Constrói a interface do usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a barra de aplicativos com o título 'Previsão do Tempo'
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
        // criar ícone de busca no AppBar (ainda não implementado)
      ),
      // Define o corpo do Scaffold
      body: Center(
        // Cria uma coluna para organizar os widgets verticalmente
        child: Column(
          children: [
            // Cria uma linha para os botões de navegação
            Row(
              children: [
                // Botão que navega para a tela de busca
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: const Text("Search")),
                // Botão que navega para a tela de favoritos
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                    child: const Text("Favorite")),
              ],
            ),
            SizedBox(height: 12), // Espaço vertical entre os widgets
            // Verifica se a lista de climas está vazia
            _controller.listWeather.isEmpty
                ? Column(
                    children: [
                      Text("Carregando..."), // Mostra um texto enquanto carrega
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          _getWeather(); // Atualiza o clima ao pressionar o botão de refresh
                        },
                      )
                    ],
                  )
                : Column(
                    children: [
                      // Mostra as informações do clima se a lista não estiver vazia
                      Text(_controller.listWeather.last.city),
                      Text(_controller.listWeather.last.description),
                      Text((_controller.listWeather.last.temp - 273)
                          .toStringAsFixed(2)),
                      Text((_controller.listWeather.last.tempMin - 273)
                          .toStringAsFixed(2)),
                      Text((_controller.listWeather.last.tempMax - 273)
                          .toStringAsFixed(2)),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          _getWeather(); // Atualiza o clima ao pressionar o botão de refresh
                        },
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
