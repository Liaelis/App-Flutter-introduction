import 'package:flutter/material.dart';
class Cat{
  String nome;
  String foto;

  Cat(this.nome, this.foto);

}
class HelloPageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView de gatinhos"),
      ),
      body: _body(),
    );
  }

//forma de criar list dinamica
  _body() {
    List<Cat> cats = [
      Cat("kiwi","assets/images/foto1.jpg"),
      Cat("cookie","assets/images/foto2.jpg"),
      Cat("robert","assets/images/foto3.jpg"),
      Cat("minerva","assets/images/foto4.jpg"),
      Cat("biscoito","assets/images/foto5.jpg")
    ];
    // será convertido o objeto para widget
    return ListView.builder(
      itemCount: cats.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Cat cat = cats[index];
        return _img(cat.foto);
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
//_img(String img) {
//  return Container(
//    // margin: EdgeInsets.all(10),
//    child: Image.asset(
//      img,
//      fit: BoxFit.cover,
//    ),
//  );
//}
//lista dinamica sem objetos
//List<Image> imgs = [
//  _img("assets/images/foto1.jpg"),
//  _img("assets/images/foto2.jpg"),
//  _img("assets/images/foto3.jpg"),
//  _img("assets/images/foto4.jpg"),
//  _img("assets/images/foto5.jpg")
//];
//return ListView.builder(
//itemCount: imgs.length,
//itemExtent: 300,
//itemBuilder: (context, index) {
//return imgs[index];
//},
//);