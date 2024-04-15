// lib\main.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences_sqlite/views/home_page.dart';
import 'package:shared_preferences_sqlite/views/login_page.dart';
import 'package:shared_preferences_sqlite/views/register_page.dart';
import 'package:shared_preferences_sqlite/views/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
