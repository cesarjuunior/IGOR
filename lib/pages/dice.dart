import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:igor/objetos/rodadaDTO.dart';
import 'package:igor/repository/sessarfirebaseFirestoreService.dart';

class dice extends StatefulWidget {
  //dice({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _diceState createState() => new _diceState();
}

class _diceState extends State<dice> {
  final double _buttonPadding = 20.0;
  final double _buttonFontSize = 32.0;
  final String _buttonFontFamily = "Roboto";
  final FontWeight _buttonFontWeight = FontWeight.w500;
  final Color _buttonFontColor = Color(0xFFffffff);

  SessaoFirebaseFirestoreService db = new SessaoFirebaseFirestoreService();
  List<Rodada> items;
  StreamSubscription<QuerySnapshot> rodadas;

  int _value = 0;
  Random random = new Random();

  void _roll(int max) {
    int result = random.nextInt(max) + 1; // Range of 0-max
    setState(() {
      _value = result;
    });

    db.inserirJogadas(_value.toString());

    print("Resultado = $_value");
  }

  void _rollD12() {
    _roll(12);
  }

  @override
  void initState() {
    super.initState();

    items = new List();

    rodadas?.cancel();

    rodadas = db.getNoteList().listen((QuerySnapshot snapshot) {
      final List<Rodada> notes = snapshot.documents
          .map((documentSnapshot) => Rodada.fromMap(documentSnapshot.data))
          .toList();
      setState(() {
        this.items = notes;
      });
    });
  }

  @override
  void dispose() {
    rodadas?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //backgroundColor: Color(0xff221233),
      home: Scaffold(
        backgroundColor: Color(0xff221233),
        body: Column(
            children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
              height: 60,
              width: 130,
              color: Colors.amber[100],
              child: Text("$_value",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 50.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w900,
                      fontFamily: "Roboto")
              ),
            ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                        onPressed: _rollD12,
                        color: Colors.deepPurple,
                        padding: EdgeInsets.all(_buttonPadding),
                        child: new Text("ROLAR DADO",
                            style: new TextStyle(
                                fontSize: _buttonFontSize,
                                color: _buttonFontColor,
                                fontWeight: _buttonFontWeight,
                                fontFamily: _buttonFontFamily)))
                  ]),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, position){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              '${items[position].jogada}',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Fira Sans',
                                color: Colors.black,
                              ),
                            ),
//                                          onTap: () =>
//                                              _navigateToAventure(context, items[position])
                          )
                        ],
                      ),
                    );
                  }
              ),
            )
          ],
        )

/*          children: [
            Container(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, position) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${items[position].jogada}',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                            ),
                          ),
                          *//*  onTap: () =>
                                                _navigateToAventure(context, items[position])*//*
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],*/
      ),
    );
  }
}
