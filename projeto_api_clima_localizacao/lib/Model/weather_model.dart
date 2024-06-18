// Define a classe Weather
class Weather {
  // Declara os atributos finais (imutáveis) da classe
  final String city;
  final String description;
  final double temp;
  final double tempMin;
  final double tempMax;

  // Construtor da classe Weather que inicializa os atributos com valores fornecidos
  Weather(
      {required this.city, // Inicializa o atributo city com o valor fornecido
      required this.description, // Inicializa o atributo description com o valor fornecido
      required this.temp, // Inicializa o atributo temp com o valor fornecido
      required this.tempMin, // Inicializa o atributo tempMin com o valor fornecido
      required this.tempMax}); // Inicializa o atributo tempMax com o valor fornecido

  // Fábrica que cria uma instância de Weather a partir de um Map (JSON)
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      // Atribui o valor da chave 'name' do JSON ao atributo city
      city: json['name'],
      // Atribui o valor da chave 'description' do primeiro elemento do array 'weather' ao atributo description
      description: json['weather'][0]['description'],
      // Atribui o valor da chave 'temp' do objeto 'main' do JSON ao atributo temp
      temp: json['main']['temp'],
      // Atribui o valor da chave 'temp_min' do objeto 'main' do JSON ao atributo tempMin
      tempMin: json['main']['temp_min'],
      // Atribui o valor da chave 'temp_max' do objeto 'main' do JSON ao atributo tempMax
      tempMax: json['main']['temp_max'],
    );
  }
}
