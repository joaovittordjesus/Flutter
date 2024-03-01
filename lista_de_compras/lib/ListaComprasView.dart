// Importando os pacotes necessários do Flutter e Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListaComprasController.dart';

// Tela principal do aplicativo de lista de compras
class ListaComprasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar novo item à lista
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Novo Item',
                      // Botão para adicionar o item
                      suffixIcon: IconButton(
                        onPressed: () {
                          try {
                            // Adiciona o item à lista usando o Provider
                            Provider.of<ListaComprasModel>(context, listen: false)
                                .adicionarItem(_controller.text);
                            // Limpa o campo de texto após adicionar o item
                            _controller.clear();
                          } catch (e) {
                            // Exibe uma mensagem de erro em caso de falha
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Lista de itens usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaComprasModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.itens.length,
                  itemBuilder: (context, index) {
                    final item = model.itens[index];
                    return ListTile(
                      // Nome do item
                      title: Text(item.nome),
                      // Checkbox para marcar o item como comprado
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: item.comprado,
                            onChanged: (value) {
                              // Marca o item como comprado usando o Provider
                              model.marcarComoComprado(index);
                            },
                          ),
                          // Botões adicionais para itens comprados
                          if (item.comprado)
                            ElevatedButton(
                              onPressed: () {
                                // Mostra um diálogo para editar o nome do item
                                _mostrarDialogoEditar(context, model, index);
                              },
                              child: Icon(Icons.edit),
                            ),
                          if (item.comprado)
                            ElevatedButton(
                              onPressed: () {
                                // Remove o item usando o Provider
                                model.removerItem(index);
                              },
                              child: Icon(Icons.delete),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Função para mostrar um diálogo para editar o nome do item
  _mostrarDialogoEditar(BuildContext context, ListaComprasModel model, int index) {
    TextEditingController _controllerEditar = TextEditingController();
    _controllerEditar.text = model.itens[index].nome;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Item'),
          // Campo de texto para o novo nome do item
          content: TextField(
            controller: _controllerEditar,
            decoration: InputDecoration(labelText: 'Novo Nome'),
          ),
          actions: <Widget>[
            // Botão para cancelar a edição
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            // Botão para salvar a edição
            TextButton(
              onPressed: () {
                // Edita o nome do item usando o Provider
                model.editarItem(index, _controllerEditar.text);
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
