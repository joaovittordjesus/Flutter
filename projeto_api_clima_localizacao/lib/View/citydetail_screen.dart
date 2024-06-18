// Importa o pacote Flutter Material para usar os widgets padrão do Material Design
import 'package:flutter/material.dart';

// Importa o controlador WeatherController do arquivo weather_controller.dart
import 'package:projeto_api_clima_localizacao/Controller/weather_controller.dart';

// Define o widget CityDetailsScreen que é um StatefulWidget (pode ter estado mutável)
class CityDetailsScreen extends StatefulWidget {
  // Declara um atributo final city que armazena o nome da cidade
  final String city;

  // Construtor do widget que inicializa o atributo city
  const CityDetailsScreen({super.key, required this.city});

  // Cria o estado para o widget CityDetailsScreen
  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

// Define a classe de estado _CityDetailsScreenState para o widget CityDetailsScreen
class _CityDetailsScreenState extends State<CityDetailsScreen> {
  // Cria uma instância do WeatherController
  final WeatherController _controller = WeatherController();

  // Constrói a interface do usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a barra de aplicativos com o título sendo o nome da cidade
      appBar: AppBar(
        title: Text(widget.city),
      ),
      // Define o corpo do Scaffold com um Padding (espaçamento)
      body: Padding(
        padding: EdgeInsets.all(12),
        // Centraliza o conteúdo
        child: Center(
          // Usa um FutureBuilder para construir a interface baseada no estado do Future
          child: FutureBuilder(
            // Chama o método getFromWeatherService do controlador passando o nome da cidade
            future: _controller.getFromWeatherService(widget.city),
            // Constrói a interface baseada no estado do Future
            builder: (context, snapshot) {
              // Verifica se a lista de climas está vazia (ainda carregando)
              if (_controller.listWeather.isEmpty) {
                // Mostra um indicador de progresso circular enquanto carrega
                return CircularProgressIndicator();
              } else {
                // Se a lista não está vazia, mostra os dados do clima
                return Column(
                  children: [
                    // Cria uma linha para mostrar o nome da cidade e o ícone de favorito
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Mostra o nome da cidade
                        Text(_controller.listWeather.last.city),
                        // Ícone de favorito (ainda sem funcionalidade)
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            // Criar a função para favoritar (não implementada)
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Mostra a descrição do clima
                    Text(_controller.listWeather.last.description),
                    const SizedBox(
                      height: 12,
                    ),
                    // Mostra a temperatura, convertida de Kelvin para Celsius
                    Text((_controller.listWeather.last.temp - 273)
                        .toStringAsFixed(2)),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
