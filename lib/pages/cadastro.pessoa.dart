import 'package:flutter/material.dart';

// ignore: camel_case_types
class cadastroPessoa extends StatefulWidget {
  @override
  _cadastroPessoaState createState() => _cadastroPessoaState();
}

// ignore: camel_case_types
class _cadastroPessoaState extends State<cadastroPessoa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/background.png"),
                fit: BoxFit.fill)),
        child: _body(),
      ),
    );
  }

  _body(){
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'lib/images/igor_icon.png',
                width: 200,
                height: 60,
                fit: BoxFit.fill,
              ),
              Divider(height: 70, color: Colors.transparent),
              Image.asset(
                'lib/images/botao_facebook.png',
                width: 220,
                height: 50,
                fit: BoxFit.fill,
              ),
              Divider(height: 10, color: Colors.transparent),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Material(
                  borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10 , bottom: 10),
                    child: Column(
                      children: <Widget>[
                        caixaDeTexto("E-mail"),
                        caixaDeTexto("Nome do Usuário"),
                        caixaDeTexto("Data de Nascimento"),
                        caixaDeTexto("Senha"),
                        Divider(height: 10, color: Colors.transparent),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            _botaoCriar()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

  TextFormField caixaDeTexto(String label) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black, fontSize: 15),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}

class _botaoCriar extends StatelessWidget {
  const _botaoCriar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width:80,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image:AssetImage("lib/images/botao_criar.png"),
                  fit:BoxFit.cover
              ),
            )
        ),onTap:(){
      print("you clicked my");
    }
    );
  }
}
