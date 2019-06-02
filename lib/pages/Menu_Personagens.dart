import 'package:flutter/material.dart';
import 'package:igor/pages/GretchenPer.dart';
import 'package:igor/pages/GokuPer.dart';
import 'package:igor/pages/ThanosPer.dart';
import 'package:igor/pages/PikachuPer.dart';
import 'package:igor/pages/RonaldinhoPer.dart';
import 'package:igor/pages/RusbePer.dart';

class MenuPersonagemPage extends StatefulWidget {
  @override
  _MenuPersonagemPageState createState() => _MenuPersonagemPageState();
}

class _MenuPersonagemPageState extends State<MenuPersonagemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/background.png"),
                      fit: BoxFit.fill)),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Divider(height: 30, color: Colors.transparent),
                      Image.asset(
                        'lib/images/igor_icon.png',
                        width: 200,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                      Divider(height: 50, color: Colors.transparent),
                      Text(
                        "PERSONAGENS",
                        style: TextStyle(
                            fontSize: 40, color: /*Colors.amber[100]*/Color(0xff221233), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(height: 70, color: Colors.transparent),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    RaisedButton(
                                      shape: new CircleBorder(side: BorderSide(style: BorderStyle.solid)),
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage ("lib/images/Goku.jpg"),
                                              )
                                          )
                                      ), // Container,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GokuPage()),
                                        );
                                      },
                                    ),
                                    RaisedButton(
                                      shape: new CircleBorder(side: BorderSide(style: BorderStyle.solid)),
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage ("lib/images/Pikachu.png"),
                                              )
                                          )
                                      ), // Container,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PikachuPage()),
                                        );
                                      },
                                    ),
                                    RaisedButton(
                                      shape: new CircleBorder(side: BorderSide(style: BorderStyle.solid)),
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage ("lib/images/Thanos.jpg"),
                                              )
                                          )
                                      ), // Container,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ThanosPage()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Divider(height: 20, color: Colors.transparent),
                                Row(
                                  children: <Widget>[
                                    RaisedButton(
                                      shape: new CircleBorder(side: BorderSide(style: BorderStyle.solid)),
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage ("lib/images/Rusbe.jpg"),
                                              )
                                          )
                                      ), // Container,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => RusbePage()),
                                        );
                                      },
                                    ),
                                    RaisedButton(
                                      shape: new CircleBorder(side: BorderSide(style: BorderStyle.solid)),
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage ("lib/images/Ronaldinho.png"),
                                              )
                                          )
                                      ), // Container,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => RonaldinhoPage()),
                                        );
                                      },
                                    ),
                                    RaisedButton(
                                      shape: new CircleBorder(side: BorderSide(style: BorderStyle.solid)),
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage ("lib/images/Gretchen.jpg"),
                                              )
                                          )
                                      ), // Container,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GretchenPage()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
      )
    );
  }
}