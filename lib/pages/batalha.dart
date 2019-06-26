import 'package:flutter/material.dart';

import 'dice.dart';

class Batalha extends StatefulWidget {
  @override
  _BatalhaState createState() => _BatalhaState();
}

class _BatalhaState extends State<Batalha> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            RaisedButton(
              shape: BeveledRectangleBorder(),
              color: Colors.amberAccent,
              child: Text("Rolar Dado"),
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => dice()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
