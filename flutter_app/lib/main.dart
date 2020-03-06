import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';



void main() => runApp(MyApp()); // função que inicializa o app

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // se define uma vez só no app inteiro
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}


