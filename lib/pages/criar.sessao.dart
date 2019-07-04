import 'package:flutter/material.dart';
import 'package:igor/objetos/sessaoDTO.dart';
import 'package:igor/pages/batalha.dart';
import 'package:igor/pages/dice.dart';
import 'package:igor/repository/aventurafirebaseFirestoreService.dart';
import 'package:igor/repository/sessarfirebaseFirestoreService.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class CriarSessao extends StatefulWidget {
  @override
  _CriarSessaoState createState() => _CriarSessaoState();
}

class _CriarSessaoState extends State<CriarSessao> {
  TextEditingController _descricaoSessao;

  SessaoFirebaseFirestoreService db = new SessaoFirebaseFirestoreService();

  String _value = '';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.teal,
                            onPressed: _selectDate, child: new Text('Selecione a data'),
                          ),
                          Text("               "),
                          Text(_value, style: TextStyle(
                              fontFamily: 'Fira Sans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15)),
                        ],
                      ),
                      Divider(height: 30, color: Colors.transparent),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "lib/images/botao_criar.png"),
                                        fit: BoxFit.cover
                                    ),
                                  )
                              ), onTap: () => inserirSessao(),
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
  Future<Sessao> inserirSessao() async {
    db.inserirSessao(_descricaoSessao.text, _value);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => dice()));
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2101)
    );
    var mascara = new DateFormat('dd/MM');
    String formatted = mascara.format(picked);

    if(formatted != null) setState(() => _value = formatted);
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
