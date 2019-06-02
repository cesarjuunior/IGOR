import 'package:flutter/material.dart';

class ThanosPage extends StatefulWidget {
  @override
  _ThanosPageState createState() => _ThanosPageState();
}

class _ThanosPageState extends State<ThanosPage> {
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
} // ThanosPageState

_imgPer() {
  int vida = 100;
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
                  image: AssetImage("lib/images/Thanos.jpg"),
                ))), // Container
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //NOME
              Divider(height: 20, color: Colors.transparent),
              Text(
                'THANOS',
                style: TextStyle(
                    fontFamily: 'Fira Sans', color: Color(0xff221233), fontSize: 30),
              ),
              //VIDA
              Divider(height: 20, color: Colors.transparent),
              Text(
                vida.toString() + ' PONTOS DE VIDA',
                style: TextStyle(
                    fontFamily: 'Fira Sans',
                    color: Colors.tealAccent,
                    fontSize: 22),
                textAlign: TextAlign.left,
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
            'HABILIDADES:',
            style: TextStyle(
                fontFamily: 'Fira Sans',
                color: Colors.green,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Divider(height: 10, color: Colors.transparent),
          Text(
            '- Dano recebido deve ser exatamento o do dado\n- Pode jogar o dado repetidas vezes enquanto a soma das jogadas for menor que 6'
            ', e, caso a soma seja exatamente 6, o jogador alvo, inevitavelmente, recebe um dano fatal',
            style: TextStyle(
                fontFamily: 'Fira Sans', color: Colors.green, fontSize: 20),
          ),
        ], // children column
      ), //Column
    ), //Padding
  ); //center
} // _body
