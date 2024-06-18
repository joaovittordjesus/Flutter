// Importa a biblioteca 'dart:convert' para manipulação de JSON
import 'dart:convert';

// Importa a biblioteca 'http' para fazer requisições HTTP, e a renomeia como 'http' para facilitar o uso
import 'package:http/http.dart' as http;

// Define a classe WeatherService
class WeatherService {
  // Declara o atributo final 'apiKey' que contém a chave da API
  final String apiKey = 'b9ebe666087f299f5e2aad3a03d093b6';

  // Declara o atributo final 'baseUrl' que contém a URL base da API do OpenWeatherMap
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Define um método assíncrono para obter o clima de uma cidade pelo nome
  Future<Map<String, dynamic>> getWeather(String city) async {
    // Cria a URL completa para a requisição HTTP, incluindo a cidade e a chave da API
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey');

    // Faz uma requisição HTTP GET para a URL
    final response = await http.get(url);

    // Verifica se o status da resposta é 200 (OK)
    if (response.statusCode == 200) {
      // Decodifica o corpo da resposta JSON e retorna como um mapa
      return jsonDecode(response.body);
    } else {
      // Lança uma exceção se a requisição falhar
      throw Exception('Failed to load weather data');
    }
  }

  // Define um método assíncrono para obter o clima pela localização (latitude e longitude)
  Future<Map<String, dynamic>> getWeatherByLocation(
      double lat, double lon) async {
    // Cria a URL completa para a requisição HTTP, incluindo latitude, longitude e a chave da API
    final url = Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey');

    // Faz uma requisição HTTP GET para a URL
    final response = await http.get(url);

    // Verifica se o status da resposta é 200 (OK)
    if (response.statusCode == 200) {
      // Decodifica o corpo da resposta JSON e retorna como um mapa
      return jsonDecode(response.body);
    } else {
      // Lança uma exceção se a requisição falhar
      throw Exception('Failed to load weather data');
    }
  }
}
