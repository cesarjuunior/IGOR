import 'dart:math';
import 'package:flutter/material.dart';

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

  int _value = 0;
  Random random = new Random();

  void _roll(int max) {
    int result = random.nextInt(max) + 1; // Range of 0-max
    setState(() {
      _value = result;
    });
    print("Resultado = $_value");

  }


  void _rollD12() {
    _roll(12);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                height: 125,
                width: 150,
                color: Colors.amber[100],
                child: Text("$_value",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 100.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto")),
              ),
              Divider(
                color: Colors.transparent,
                height: 50,
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                        onPressed: _rollD12,
                        color: Colors.deepPurple,
                        padding: EdgeInsets.all(_buttonPadding),
                        child: new Text("ROLAR",
                            style: new TextStyle(
                                fontSize: _buttonFontSize,
                                color: _buttonFontColor,
                                fontWeight: _buttonFontWeight,
                                fontFamily: _buttonFontFamily)))
                  ]),
            ]),
      ),
    );
  }
}