import 'package:flutter/material.dart';

class RonaldinhoPage extends StatefulWidget {
  @override
  _RonaldinhoPageState createState() => _RonaldinhoPageState();
}

class _RonaldinhoPageState extends State<RonaldinhoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: Container(
                padding: EdgeInsets.only(
                    left: 10, top: 10, right: 10, bottom: 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/images/background.png"),
                        fit: BoxFit.fill)),
                child: ListView(
                  children: <Widget>[
                    _imgPer(),
                    _body(),
                    //Divider(height: 40, color: Colors.transparent),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color(0xff221233),
                            child: Text(
                              "Rejeitar",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color(0xff221233),
                            child: Text(
                              "Aceitar",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () {
                              Scaffold.of(context).showSnackBar(
                                  new SnackBar(
                                      content: new Text(
                                          'Aceitou o personagem')));
                            },
                          ),
                        ], // row children
                      ), // row
                    ), // Padding
                  ], // column children
                ) // Column
            ), //container
          );
        }, // builder 2
      ),
    );
  } // build
} // _RonaldinhoPageState

_imgPer(){
  int vida = 40;
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Divider(height: 50, color: Colors.black),
        Container(
            width: 200,
            height: 200,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage ("lib/images/Ronaldinho.png"),
                )
            )
        ), // Container
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //NOME
              Divider(height: 20, color: Colors.transparent),
              Text(
                'RONALDINHO',
                style: TextStyle(fontFamily: 'Fira Sans', color: Color(0xff221233), fontSize: 30),
              ),
              //VIDA
              Divider(height: 20, color: Colors.transparent),
              Text(
                vida.toString() + ' PONTOS DE VIDA',
                style: TextStyle(fontFamily: 'Fira Sans', color: Colors.tealAccent, fontSize: 22),textAlign: TextAlign.left,
              ),
            ], // children
          ), // Column
        ), // Padding
      ], // children
    ), // Column
  ); // Center
} // _imgPer()

_body() {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //VANTAGENS
          Divider(height: 20, color: Colors.transparent),
          Text(
            'VANTAGENS:',
            style: TextStyle(fontFamily: 'Fira Sans', color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Divider(height: 10, color: Colors.transparent),
          Text(
            '- Recebe metade de danos pares\n- Imune a danos impares\n- Uma vez por partida, ao ser definido como alvo, pode trocar de lugar com algum outro jogador que não seja o atacante',
            style: TextStyle(fontFamily: 'Fira Sans', color: Colors.green, fontSize: 20),
          ),
          //DESVANTAGENS
          Divider(height: 50, color: Colors.transparent),
          Text(
            'DESVANTAGENS:',
            style: TextStyle(fontFamily: 'Fira Sans', color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Divider(height: 10, color: Colors.transparent),
          Text(
            '- Ao trocar de lugar com outro personagem, recebe 5 de dano',
            style: TextStyle(fontFamily: 'Fira Sans', color: Colors.red, fontSize: 20),
          ),
        ], // children column
      ),//Column
    ), //Padding
  ); //center
} // _body