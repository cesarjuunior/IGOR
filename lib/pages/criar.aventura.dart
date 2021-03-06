import 'dart:math';

import 'package:flutter/material.dart';
import 'package:igor/objetos/aventuraDTO.dart';
import 'package:igor/pages/home.dart';
import 'package:igor/repository/aventurafirebaseFirestoreService.dart';

class _criarAventuraState extends State<criarAventura> {

  TextEditingController _descricaoAventura;

  AventuraFirebaseFirestoreService db = new AventuraFirebaseFirestoreService();

  @override
  void initState() {
    super.initState();

    _descricaoAventura = new TextEditingController();

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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/background.png"),
                fit: BoxFit.fill)),
        child: _body(),
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
                title: Text(
                  'Aventuras',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontFamily: 'Fira Sans',
                  ),
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
                title: Text(
                  'Livros',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontFamily: 'Fira Sans',
                  ),
                ),
                onLongPress: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'lib/images/conta-icone.png',
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  'Conta',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontFamily: 'Fira Sans',
                  ),
                ),
                onLongPress: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'lib/images/notificacoes-icone.png',
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  'Notificações',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontFamily: 'Fira Sans',
                  ),
                ),
                onLongPress: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'lib/images/configuracoes-icone.png',
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  'Configurações',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontFamily: 'Fira Sans',
                  ),
                ),
                onLongPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(height: 20, color: Colors.transparent),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Material(
                borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[_botaoFechar()],
                      ),
                      TextFormField(
                        controller: _descricaoAventura,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          labelText: "Dê um nome para sua aventura",
                        ),
                      ),
                      Divider(height: 10, color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                              child: Container(
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "lib/images/botao_criar.png"),
                                        fit: BoxFit.cover
                                    ),
                                  )
                              ), onTap: () => inserirAventura(),
                          )
                        ],
                      ),
                      Divider(height: 500, color: Colors.transparent),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  // ignore: missing_return
  Future<Aventura> inserirAventura() async{
    String imagemTema = escolherImagem();
    db.inserirAventura(_descricaoAventura.text, imagemTema);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }


  String escolherImagem() {

    var rng = new Random();
    int n = rng.nextInt(4);

    if(n == 0){
      return "lib/images/miniatura_coast.png";
    }else if(n == 1){
      return "lib/images/miniatura_corvali.png";
    }else if(n == 2){
      return "lib/images/miniatura_heartlands.png";
    }else if(n == 3){
      return "lib/images/miniatura_imagem_automática.png";
    }else if(n == 4){
      return "lib/images/miniatura_krevast.png";
    }
  }
}

class criarAventura extends StatefulWidget {
  @override
  _criarAventuraState createState() => _criarAventuraState();
}

class _botaoFechar extends StatelessWidget {
  const _botaoFechar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("lib/images/botao_fechar.png"),
                  fit: BoxFit.cover),
            )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()),
          );
        });
  }
}
