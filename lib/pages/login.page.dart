import 'package:flutter/material.dart';
import 'package:igor/pages/cadastro.pessoa.dart';
import 'package:igor/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
    bool manterConectado = false;
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(height: 70, color: Colors.transparent),
              Image.asset(
                'lib/images/igor_icon.png',
                width: 200,
                height: 60,
                fit: BoxFit.fill,
              ),
              Divider(color: Colors.transparent),
              Image.asset(
                'lib/images/botao_google.png',
                width: 220,
                height: 50,
                fit: BoxFit.fill,
              ),
              Divider(height: 5, color: Colors.transparent),
              Image.asset(
                'lib/images/botao_facebook.png',
                width: 220,
                height: 50,
                fit: BoxFit.fill,
              ),
              Divider(height: 20, color: Colors.transparent),
              Text(
                'OU',
                style: TextStyle(
                    fontFamily: 'Fira Sans',
                    color: Colors.white,
                    fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 15),
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(color: Colors.transparent),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 15),
                      decoration: InputDecoration(
                        hintText: "Senha",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: manterConectado,
                        checkColor: Colors.white,
                        activeColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            manterConectado = value;
                          });
                        }
                    ),
                    Text("manter-me conectado",
                        style: TextStyle(
                            fontFamily: 'Fira Sans',
                            color: Colors.white,
                            fontSize: 15)
                    ),
                    Divider(indent: 27,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new _botaoEntrar()
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.transparent),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                        padding: EdgeInsets.only(left: 0, right: 40),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cadastroPessoa()),
                          );
                        },
                        child: Text('criar conta',
                          style: TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.tealAccent,
                              fontSize: 15),
                        )
                    ),
                    FlatButton(
                        padding: EdgeInsets.only(left: 30, right: 0),
                        onPressed: () {
                          print("clicou no esqueceu a senha");
                        },
                        child: Text('esqueci minha senha',

                          style: TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                              fontSize: 15),
                        )
                    ),
                  ],
                ),
              ),
              Divider(height: 100, color: Colors.transparent),
            ],
          ),
        )
    );
  }
}

class _botaoEntrar extends StatelessWidget {
  const _botaoEntrar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: 90,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("lib/images/botao_entrar.png"),
                  fit: BoxFit.cover
              ),
            )
        ), onTap: () {
      print(
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()
            ),
          )
      );
    }
    );
  }
}


