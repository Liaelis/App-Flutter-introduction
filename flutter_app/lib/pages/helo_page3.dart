import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Cat{
  String nome;
  String foto;

  Cat(this.nome, this.foto);

}
class HelloPageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid de gatinhos"),
      ),
      body: _body(),
    );
  }

//forma de criar list dinamica
  _body() {
    List<Cat> cats = [
      Cat("cookie","assets/images/foto2.jpg"),
      Cat("robert","assets/images/foto3.jpg"),
      Cat("minerva","assets/images/foto4.jpg"),
      Cat("kiwi","assets/images/foto1.jpg"),
      Cat("cookie","assets/images/foto2.jpg"),
      Cat("robert","assets/images/foto3.jpg"),
      Cat("minerva","assets/images/foto4.jpg"),
      Cat("biscoito","assets/images/foto5.jpg")
    ];
    // será convertido o objeto para widget
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
      itemCount: cats.length,
      itemBuilder: (context, index) {
        Cat cat = cats[index];
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(cat.foto),
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black45
                ),
                child: Text(
                  cat.nome,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
