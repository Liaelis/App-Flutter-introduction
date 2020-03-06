import 'package:flutter/material.dart';
import 'package:flutter_app/pages/cat_page.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widget/button_theme.dart';
class Cat{
  String nome;
  String foto;

  Cat(this.nome, this.foto);

}
class HelloPage2 extends StatefulWidget {

  @override
  _HelloPage2State createState() => _HelloPage2State();
}

class _HelloPage2State extends State<HelloPage2> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina de gatinho 2"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("lista");
              setState(() {
                _gridView = false;
              });

            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              print("Grid");
              setState(() {
                _gridView = true;
              });// apos esse metodo ser carregado o flutter chama a função de builder novamente

            },
          ),
        ],
      ),
      body: _body(),
    );
  }

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
    if(_gridView){
      // será convertido o objeto para widget
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
        itemCount: cats.length,
        itemBuilder: (context, index) {

          return _itemView(cats,index);
        },
      );
    }else{
      // será convertido o objeto para widget
      return ListView.builder(
        itemExtent: 350,
        itemCount: cats.length,
        itemBuilder: (context, index) {

          return _itemView(cats,index);
        },
      );
    }

  }

 _itemView(List<Cat> cats, int index) {
    Cat cat = cats[index];
    return GestureDetector(
      onTap: (){
        push(context,CatPage(cat));
      },
      child: Stack(
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
        ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
//botão voltar
//_body(BuildContext context) {
//  return Center(
//    child: ButtonThemeApp("voltar", () => _onClickVoltar(context)),
//  );
//}
//
//_onClickVoltar(BuildContext context) {
//  return Navigator.pop(context, "pagina 2");
//}