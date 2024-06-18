// Importa o modelo Weather do arquivo weather_model.dart
import '../Model/weather_model.dart';

// Importa o serviço WeatherService do arquivo weather_service.dart
import '../Service/weather_service.dart';

// Define a classe WeatherController
class WeatherController {
  // Declara uma lista de objetos Weather chamada listWeather
  List<Weather> listWeather = [];

  // Cria uma instância do WeatherService
  WeatherService _service = new WeatherService();

  // Define um método assíncrono para obter o tempo de uma cidade
  Future<void> getFromWeatherService(String city) async {
    // Obtém o clima da cidade usando o serviço e converte a resposta JSON em um objeto Weather
    Weather weather = Weather.fromJson(await _service.getWeather(city));
    // Adiciona o objeto Weather à lista listWeather
    listWeather.add(weather);
  }

  // Define um método assíncrono para obter o tempo baseado em coordenadas de latitude e longitude
  Future<void> getFromWeatherServiceLocation(double lat, double lon) async {
    // Obtém o clima pela localização usando o serviço e converte a resposta JSON em um objeto Weather
    Weather weather =
        Weather.fromJson(await _service.getWeatherByLocation(lat, lon));
    // Adiciona o objeto Weather à lista listWeather
    listWeather.add(weather);
  }

  // Define um método assíncrono para verificar se uma cidade existe no serviço de clima
  Future<bool> findCity(String city) async {
    // Obtém o clima da cidade usando o serviço e converte a resposta JSON em um objeto Weather
    Weather weather = Weather.fromJson(await _service.getWeather(city));
    // Verifica se o nome da cidade não está vazio
    if (weather.city.isNotEmpty) {
      // Retorna verdadeiro se a cidade não está vazia
      return true;
    } else {
      // Retorna falso se a cidade está vazia
      return false;
    }
  }
}
