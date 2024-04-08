<<<<<<< HEAD
// View.dart

// Importa o controlador do banco de dados e o modelo de contato
import 'package:exemplo_persistencia_sqllite/DataBaseController.dart';
import 'package:flutter/material.dart';
import 'package:exemplo_persistencia_sqllite/Model.dart';

// Classe responsável por exibir a página inicial do aplicativo
class HomePage extends StatelessWidget {
  // Instância do helper do banco de dados
  final dbHelper = DataBaseHelper();
=======
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Controller.dart';
import 'Model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = BancoDadosCrud();
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de texto
  TextEditingController _idController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
>>>>>>> dde045ff2b247d32c368a85542a438538ccc8728

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
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
=======
        title: Text('SQLite Demo'),
      ),
      body: FutureBuilder<List<ContatoModel>>(
        future: dbHelper.getContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum Contato Cadastrado'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data![index];
                return ListTile(
                  title: Text(contact.nome),
                  subtitle: Text(contact.telefone),
                  onTap: () {
                    //criar um método para Ver informações do contato
>>>>>>> dde045ff2b247d32c368a85542a438538ccc8728
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
<<<<<<< HEAD
        // Botão flutuante para adicionar novo contato
        onPressed: () {
          // Implementa a funcionalidade ao pressionar o botão
        },
        child: Icon(Icons.add), // Ícone do botão flutuante
      ),
    );
  }
=======
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Método para exibir um diálogo para adicionar um novo contato
  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Contato'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'ID'),
                  keyboardType: TextInputType
                      .number, // Define o tipo de teclado para numérico
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly // Permite apenas a entrada de dígitos
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an ID';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid ID (only digits allowed)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _telefoneController,
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
                TextFormField(
                  controller: _enderecoController,
                  decoration: InputDecoration(labelText: 'Endereço'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addContact();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Método para adicionar um novo contato ao banco de dados
  void _addContact() {
    final newContact = ContatoModel(
      id: int.parse(_idController.text),
      nome: _nomeController.text,
      email: _emailController.text,
      telefone: _telefoneController.text,
      endereco: _enderecoController.text,
    );

    dbHelper.create(newContact);
    setState(() {
      // Atualiza a lista de contatos
    });
  }
>>>>>>> dde045ff2b247d32c368a85542a438538ccc8728
}
