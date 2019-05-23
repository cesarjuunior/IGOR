import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/background.png"),
                fit: BoxFit.cover)),
        child: _parteSuperiorTela(),
      ),
    );
  }
  Widget _parteSuperiorTela(){
    return  Container(
      child: Column(
        children: <Widget>[
          Divider(height: 70, color: Colors.transparent),
          Image.asset(
            'lib/images/igor_icon.png',
            width: 200,
            height: 60,
            fit: BoxFit.fill,
          ),
          Divider(),
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
          _parteInferior()
        ],
      ),
    );
  }

  Widget _parteInferior(){
    bool manterConectado = false;
    return new Container(
      padding: EdgeInsets.only(left: 30, right: 30, ),
      child: new Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
                hintText:"E-mail",
                hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Divider(color: Colors.transparent),
          TextFormField(
            autofocus: true,
            obscureText: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              hintText:"Senha",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        Row(
          children: <Widget>[
            Checkbox(
              value: manterConectado,
              checkColor: Colors.white,
              activeColor: Colors.white,
              onChanged: (bool value){
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
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new _botaoEntrar()
            ],
          ),
          Divider(color: Colors.transparent),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                  padding: EdgeInsets.only(left: 0, right: 40),

                  onPressed: () {
                    print("clicou no criar conta");
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
                        color: Colors.tealAccent,
                        fontSize: 15),
                  )
              ),
            ],
          )
        ],
      ),
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
            width:120,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image:AssetImage("lib/images/botao_entrar.png"),
                    fit:BoxFit.cover
                ),
            )
        ),onTap:(){
      print("you clicked my");
    }
    );
  }
}

/*    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/background.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          body: Padding(
              padding: EdgeInsets.all(80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Divider(height: 70, color: Colors.transparent),
                    Image.asset(
                      'lib/images/igor_icon.png',
                      width: 200,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    Divider(),
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
                    Column(children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: new TextStyle(color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                      Divider(),
                      TextFormField(
                        autofocus: true,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: new TextStyle(color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ]),
                    Column(children: <Widget>[

                      Row(children:[
                        Text(
                          'OU',
                          style: TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          'OU',
                          style: TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],)
                    ],)
                  ]),
          )
        ),
      ),
    );*/


