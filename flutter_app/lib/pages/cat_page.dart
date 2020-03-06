import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'helo_page2.dart';


class CatPage extends StatelessWidget{
  final Cat cat;
  CatPage(this.cat);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.nome),
      ),
      body: Image.asset(cat.foto),
    );
  }

}
