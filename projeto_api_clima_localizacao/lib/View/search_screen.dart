// Importa o pacote Flutter Material para usar os widgets padrão do Material Design
import 'package:flutter/material.dart';

// Importa o controlador CityDbController do arquivo city_db_controller.dart
import 'package:projeto_api_clima_localizacao/Controller/city_db_controller.dart';

// Importa o controlador WeatherController do arquivo weather_controller.dart
import 'package:projeto_api_clima_localizacao/Controller/weather_controller.dart';

// Importa o modelo CityDb do arquivo city_db_model.dart
import 'package:projeto_api_clima_localizacao/Model/city_db_model.dart';

// Importa o widget CityDetailsScreen do arquivo citydetail_screen.dart
import 'citydetail_screen.dart';

// Define o widget SearchScreen que é um StatefulWidget (pode ter estado mutável)
class SearchScreen extends StatefulWidget {
  // Construtor padrão do widget SearchScreen
  const SearchScreen({super.key});

  // Cria o estado para o widget SearchScreen
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// Define a classe de estado _SearchScreenState para o widget SearchScreen
class _SearchScreenState extends State<SearchScreen> {
  // Controlador para o campo de texto onde o usuário digita o nome da cidade
  TextEditingController _cityController = TextEditingController();
  // Chave global para identificar o formulário e validar os campos
  final _formKey = GlobalKey<FormState>();
  // Instância do WeatherController para buscar os dados do clima
  final WeatherController _controller = WeatherController();
  // Instância do CityDbController para gerenciar o banco de dados de cidades
  final CityDbController _cityDbController = CityDbController();

  // Constrói a interface do usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a barra de aplicativos com o título 'Search City'
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      // Define o corpo do Scaffold com um Padding (espaçamento)
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Centraliza o conteúdo
        child: Center(
          // Cria um formulário
          child: Form(
            key: _formKey,
            // Coluna para organizar os widgets verticalmente
            child: Column(
              children: [
                // Campo de texto para digitar o nome da cidade
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Enter City',
                  ),
                  // Validação do campo de texto
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter city';
                    }
                    return null;
                  },
                ),
                // Botão para iniciar a busca da cidade
                ElevatedButton(
                  onPressed: () {
                    // Verifica se o formulário é válido
                    if (_formKey.currentState!.validate()) {
                      // Chama o método _findCity passando o nome da cidade digitada
                      _findCity(_cityController.text);
                    }
                  },
                  child: const Text('Search'),
                ),
                const SizedBox(height: 20),
                // Lista expandida para exibir as cidades salvas
                Expanded(
                  child: FutureBuilder(
                    future: _cityDbController.getAllCities(),
                    builder: (context, snapshot) {
                      // Se a lista de cidades está vazia, exibe um indicador de carregamento
                      if (_cityDbController.getCities().isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        // Caso contrário, exibe a lista de cidades salvas
                        return ListView.builder(
                          itemCount: _cityDbController.getCities().length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                _cityDbController.getCities()[index].cityName,
                              ),
                              onTap: () {
                                // Chama o método _findCity com o nome da cidade ao clicar na cidade da lista
                                _findCity(
                                  _cityDbController.getCities()[index].cityName,
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método assíncrono para buscar a cidade
  Future<void> _findCity(String city) async {
    // Verifica se a cidade foi encontrada
    if (await _controller.findCity(city)) {
      // Cria um objeto CityDb com o nome da cidade e um valor padrão para favoritesCities
      CityDb db = CityDb(cityName: city, favoritesCities: false);
      // Adiciona a cidade ao banco de dados
      _cityDbController.create(db);
      // Mensagem snackbar indicando que a cidade foi encontrada
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('City found'),
          duration: Duration(seconds: 1),
        ),
      );
      // Navega para a tela CityDetailsScreen passando o nome da cidade
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CityDetailsScreen(city: city),
        ),
      );
      setState(() {
        _cityDbController.getCities().clear();
      });
    } else {
      // Limpa o campo de texto se a cidade não foi encontrada
      _cityController.clear();
      // Mensagem snackbar indicando que a cidade não foi encontrada
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('City not found'),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {});
    }
  }
}
