// View.dart

// Importa o controlador do banco de dados e o modelo de contato
import 'package:exemplo_persistencia_sqllite/DataBaseController.dart';
import 'package:flutter/material.dart';
import 'package:exemplo_persistencia_sqllite/Model.dart';

// Classe responsável por exibir a página inicial do aplicativo
class HomePage extends StatelessWidget {
  // Instância do helper do banco de dados
  final dbHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'), // Título da barra de aplicativos
      ),
      body: FutureBuilder<List<ContactModel>>(
        // Widget FutureBuilder para construir com base no futuro
        future: dbHelper.getContacts(), // Obtém a lista de contatos do banco de dados
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Se estiver esperando pela conexão, exibe um indicador de carregamento
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Se houver um erro, exibe uma mensagem de erro
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Se não houver dados ou a lista estiver vazia, exibe uma mensagem
            return Center(child: Text('No contacts found.'));
          } else {
            // Caso contrário, exibe a lista de contatos
            return ListView.builder(
              itemCount: snapshot.data?.length, // Número de itens na lista
              itemBuilder: (context, index) {
                final contact = snapshot.data?[index]; // Obtém o contato atual
                return ListTile(
                  // Widget ListTile para exibir os detalhes do contato
                  title: Text(contact!.name), // Nome do contato
                  subtitle: Text(contact.email), // Email do contato
                  onTap: () {
                    // Implementa a funcionalidade ao tocar no item da lista
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Botão flutuante para adicionar novo contato
        onPressed: () {
          // Implementa a funcionalidade ao pressionar o botão
        },
        child: Icon(Icons.add), // Ícone do botão flutuante
      ),
    );
  }
}
