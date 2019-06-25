import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:igor/objetos/aventuraDTO.dart';
import 'package:igor/pages/aventura.andamento.dart';
import 'package:igor/pages/criar.aventura.dart';
import 'package:igor/repository/aventurafirebaseFirestoreService.dart';
import 'package:igor/pages/Infos.dart';
import 'cadastro.pessoa.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Aventura> items;
  AventuraFirebaseFirestoreService db = new AventuraFirebaseFirestoreService();

  StreamSubscription<QuerySnapshot> aventuras;

  bool visBotoesPer = false;

  @override
  void initState() {

    super.initState();

    items = new List();

    aventuras?.cancel();

    aventuras = db.getNoteList().listen((QuerySnapshot snapshot) {
      final List<Aventura> notes = snapshot.documents
          .map((documentSnapshot) => Aventura.fromMap(documentSnapshot.data))
          .toList();
      setState(() {
        this.items = notes;
      });
    });
  }

  @override
  void dispose() {
    aventuras?.cancel();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff221233),
        title: Image.asset(
          'lib/images/barra_navegacao.png',
          width: 100,
          height: 30,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],

      ),
      drawer: Drawer(
          child: Scaffold(
            backgroundColor: Color(0xff221233),
            body: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(''),
                ),
                ListTile(
                  leading: Image.asset(
                    'lib/images/aventuras-icone.png',
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                  title: Text('Aventuras',
                    style: TextStyle(color: Colors.yellow,fontFamily: 'Fira Sans',),
                  ),
                  onLongPress: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    'lib/images/livros-icone.png',
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                  title: Text('Livros',
                    style: TextStyle(color: Colors.yellow, fontFamily: 'Fira Sans',),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfosPage(visBotoesPer)),
                    );
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'lib/images/conta-icone.png',
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                  title: Text('Conta',
                    style: TextStyle(color: Colors.yellow, fontFamily: 'Fira Sans',),
                  ),
                  onLongPress: (){
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'lib/images/notificacoes-icone.png',
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                  title: Text('Notificações',
                    style: TextStyle(color: Colors.yellow, fontFamily: 'Fira Sans',),
                  ),
                  onLongPress: (){
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'lib/images/configuracoes-icone.png',
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                  title: Text('Configurações',
                    style: TextStyle(color: Colors.yellow, fontFamily: 'Fira Sans',),
                  ),
                  onLongPress: (){
                  },
                ),
              ],
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => criarAventura()),
          );
        },
        child: Image.asset(
          'lib/images/nova_aventura.png',
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff221233),
        ),
          child: Center(
            child: ListView.builder(
              itemCount: items.length,
              //padding: const EdgeInsets.all(2.0),
              itemBuilder: (context, position) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            '${items[position].imagemTema}'
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                    child: Column(
                    children: <Widget>[
                      Divider(height: 20.0, color: Colors.transparent),
                      ListTile(
                          title: Text(
                            '${items[position].descricaoAventura}',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                            ),
                          ),
                          /*                    leading: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(3.0)),
                          IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                          //    onPressed: () => _deleteNote(context, items[position], position)
                          ),
                        ],
                      ),*/
                          onTap: () =>
                              _navigateToAventure(context, items[position])

                      ),
                      Divider(height: 20.0, color: Colors.transparent),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  void _navigateToAventure(BuildContext context, Aventura aventura) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AventuraAndamento(aventura)),
    );
  }

  void _select(Choice choice) {
    if(choice.title == 'Editar'){
      print("EDITAR");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => cadastroPessoa()),
      );
    }else{
      print("ORDENAR");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => cadastroPessoa()),
      );
    }
  }
}



class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Editar', icon: Icons.directions_car),
  const Choice(title: 'Ordenar', icon: Icons.directions_bike),
];
