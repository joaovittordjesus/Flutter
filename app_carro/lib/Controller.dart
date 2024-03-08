import 'package:app_carro/Model.dart';

class CarroController{
  List<Carro> _carroList = [
    Carro("Fiat", 1992, ""),
    Carro("GWM", 2024, "")
  ];

  List<Carro> get listarCarros => _carroList;

  void adicionarCarro(String modelo, int ano, String imagemUrl){
    Carro carro = Carro(modelo , ano, imagemUrl);
    _carroList.add(carro);
  }
}