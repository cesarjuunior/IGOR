import 'package:flutter/material.dart';
import 'package:igor/objetos/sessaoDTO.dart';
import 'package:igor/pages/batalha.dart';
import 'package:igor/repository/aventurafirebaseFirestoreService.dart';

import 'home.dart';

class CriarSessao extends StatefulWidget {
  @override
  _CriarSessaoState createState() => _CriarSessaoState();
}

class _CriarSessaoState extends State<CriarSessao> {
  TextEditingController _descricaoSessao;

  AventuraFirebaseFirestoreService db = new AventuraFirebaseFirestoreService();


  @override
  void initState() {
    super.initState();

    _descricaoSessao = new TextEditingController();

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
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[_botaoFechar()],
                        ),
                        TextFormField(
                          controller: _descricaoSessao,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          decoration: InputDecoration(
                            labelText: "Dê um nome à próxima sessao",
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
  Future<Sessao> inserirAventura() async {
    db.inserirAventura(_descricaoSessao.text, null);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Batalha()));
  }
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
