import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/hello_listView.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widget/button_theme.dart';
import 'package:flutter_app/widget/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart'; //import do toast

import 'helo_page2.dart';
import 'helo_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "App de Gatinhos",
          ),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              text: ("TAB1"),
            ),
            Tab(
              text: ("TAB2"),
            ),
            Tab(text: ("TAB3"),),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.amber,
            )
          ],
        ),
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add),
//          backgroundColor: Colors.teal,
//          onPressed: () {
//            _onClickFab();
//          },
//        ),
        drawer: DrawerList(),
      ),
    );
  }

// se quiser prencher a tela toda com imagem usar SizedBox.expand e propriedade fit na imagem
  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      height: 280,
      child: PageView(
        children: <Widget>[
          _img("assets/images/foto1.jpg"),
          _img("assets/images/foto2.jpg"),
          _img("assets/images/foto3.jpg"),
          _img("assets/images/foto4.jpg"),
          _img("assets/images/foto5.jpg"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        // envolver com builder pra poder usar context no snack
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonThemeApp("List view",
                    () => _onClickNavigator(context, HelloPageListView())),
                ButtonThemeApp(
                    "Page 2", () => _onClickNavigator(context, HelloPage2())),
                ButtonThemeApp("Page 3",
                    () => _onClickNavigator(context, HelloPageGrid())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonThemeApp("Snack", () => _onClickSnack(context)),
                ButtonThemeApp("Dialog", () => _onClickDialog(context)),
                ButtonThemeApp("Toast", () => _onClickToast()),
              ],
            ),
          ],
        );
      },
    );
  }

  Function _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Olá Gateiros"),
        action: SnackBarAction(
          label: "Ok",
          onPressed: () => print("ok"),
          textColor: Colors.pink,
        ),
      ),
    );
  }

  Function _onClickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          //barrierDismissible impede que feche o alert ao clicar fora
          return WillPopScope(
            // utilizado pra tecla de voltar do android nao feche o alert
            onWillPop: () async => false,
            child: AlertDialog(
              // empilha outra pagina por isso usar o pop para fechar
              title: Text("Gente legal tem Gato"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(
                        context); // poderia realizar um processamento encaminhando para outra pagina
                  },
                ),
              ],
            ),
          );
        });
  }

  Function _onClickToast() {
    Fluttertoast.showToast(
        msg: "Ron ron e Miau!",
        toastLength: Toast.LENGTH_LONG,
        // tempo de visualização
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.pink,
        fontSize: 16.0);
  }

  _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print("clicou no botão!!");
    print("->>>>> $s");
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover, // adequa as iamgens para ter o mesmo tamanho
      ),
    );
  }

  _text() {
    return Text(
      "Miau!",
      style: TextStyle(
        fontSize: 30,
        color: Colors.cyan,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }

  void _onClickFab() {
    print("adiconou");
  }
}
