import 'package:flutter/material.dart';
import 'package:igor/pages/home.dart';
import 'package:igor/pages/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'IGOR',
       home: LoginPage(),
    );
  }
}
