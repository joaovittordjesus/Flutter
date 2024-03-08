
import "package:app_carro/Controller.dart"; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCarro extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Carros'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          //Lista os Carros da Lista
          Consumer<CarroController>(
            builder: (context, model, child) {
              return ListView.builder(
                itemCount: model.listarCarros.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // Exibe os Carros Listados no Controller
                    title: Text(model.listarCarros[index].modelo),
                    //quando clicado o carro vai abrir a telaDescricaoCarro
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TelaDetalheCarro(model.listarCarros[index]),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: showDialog(builder: ),
      // ),
    );
  }
}
