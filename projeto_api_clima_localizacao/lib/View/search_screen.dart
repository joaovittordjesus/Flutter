import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search City')),
      body: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: 'Enter City',
                    ),
                    validador: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please Enter City';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, routeName);
                      }
                    },
                    child: const Text('Search'),
                  )
                ],
              ))),
    );
  }
}
