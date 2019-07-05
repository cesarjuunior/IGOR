import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:igor/objetos/sessaoDTO.dart';
import 'package:igor/repository/sessarfirebaseFirestoreService.dart';

import 'dice.dart';

class Sessoes extends StatefulWidget {
  @override
  _SessoesState createState() => _SessoesState();
}

class _SessoesState extends State<Sessoes> {

  List<Sessao> items;
  SessaoFirebaseFirestoreService db = new SessaoFirebaseFirestoreService();
  StreamSubscription<QuerySnapshot> sessoes;

  @override
  void initState() {
    super.initState();
    items = new List();

    sessoes?.cancel();

    sessoes = db.getSessoesList().listen((QuerySnapshot snapshot) {
      final List<Sessao> notes = snapshot.documents
          .map((documentSnapshot) => Sessao.fromMap(documentSnapshot.data))
          .toList();
      setState(() {
        this.items = notes;
      });
    });
  }

  @override
  void dispose() {
    sessoes?.cancel();
    super.dispose();
  }

  @override
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
                onTap: () => Navigator.push( context, MaterialPageRoute(builder: (context) => dice()),),
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
                    color: Colors.black
                  ),
                  child: Column(
                    children: <Widget>[
                      Divider(height: 20.0, color: Colors.transparent),
                      ListTile(
                          title: Text(
                            '${items[position].data}' +' - ' +'${items[position].descricaoSessao}',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                            ),
                          ),
                        onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => dice())),
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
}
