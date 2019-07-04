import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igor/objetos/aventuraDTO.dart';
import 'package:igor/objetos/sessaoDTO.dart';
import 'package:igor/pages/criar.sessao.dart';
import 'package:igor/pages/sessoes.dart';
import 'package:igor/repository/sessarfirebaseFirestoreService.dart';
import 'package:igor/utils/painter.dart';

import 'home.dart';

class AventuraAndamento extends StatefulWidget {

  final Aventura aventura;
  AventuraAndamento(this.aventura);

  @override
  _AventuraAndamentoState createState() => _AventuraAndamentoState();
}

class _AventuraAndamentoState extends State<AventuraAndamento>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController = new TextEditingController();

  TextEditingController _descricao = new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  List<Sessao> items;
  SessaoFirebaseFirestoreService db = new SessaoFirebaseFirestoreService();
  StreamSubscription<QuerySnapshot> sessoes;



  String floatBotton = 'lib/images/botao_adicionar_sessao.png';
  int condicaoBotao = 1;

  @override
  void initState() {
    super.initState();
    items = new List();


    sessoes = db.getSessoesList().listen((QuerySnapshot snapshot) {
      final List<Sessao> notes = snapshot.documents
          .map((documentSnapshot) => Sessao.fromMap(documentSnapshot.data))
          .toList();
      setState(() {
        this.items = notes;
      });
    });

    _descricao = new TextEditingController(text: widget.aventura.descricaoAventura);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          escolherDestino();

        },
        child: Image.asset(floatBotton),
        backgroundColor: Colors.transparent,
      ),
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll){
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height >= 775.0 ? 775.0 : 775.0,
            decoration: new BoxDecoration(
              color: Color(0xff221233)
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignIn(context),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignUp(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();

    sessoes?.cancel();
    super.dispose();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "ANDAMENTO",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "JOGADORES",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                        child: Text(
                          _descricao.text,
                          style: TextStyle(
                              fontFamily: 'Fira Sans',
                              color: Colors.black,
                              fontSize: 20),
                        ),

                      ),
                      Divider(height: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.teal,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Sessoes()));
                            },
                            child: Text('Lista de Sessões'),
                          ),
                        ],
                      ),
//                      Column(
//                        children: <Widget>[
//                          ListView.builder(
//                              //itemCount: items.length,
//                              itemBuilder: (context, position) {
//                                return Container(
//                                  decoration: BoxDecoration(
//                                    color: Colors.grey,
//                                  ),
//                                  child: Column(
//                                    children: <Widget>[
//                                      ListTile(
//                                        title: Text(
//                                          '${items[position].descricaoSessao}',
//                                          style: TextStyle(
//                                            fontSize: 22.0,
//                                            fontFamily: 'Fira Sans',
//                                            color: Colors.white,
//                                          ),
//                                        ),
////                                          onTap: () =>
////                                              _navigateToAventure(context, items[position])
//                                      )
//                                    ],
//                                  ),
//                                );
//                              }
//                          ),
//                        ],
//                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: ColorsThema.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: ColorsThema.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        ColorsThema.loginGradientEnd,
                        ColorsThema.loginGradientStart
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 340.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: ColorsThema.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: ColorsThema.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        ColorsThema.loginGradientEnd,
                        ColorsThema.loginGradientStart
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    floatBotton = 'lib/images/botao_adicionar_sessao.png';
    condicaoBotao = 1;
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    floatBotton = 'lib/images/botao_adicionar_jogadores.png';
    condicaoBotao = 2;
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void escolherDestino() {
    if(condicaoBotao == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CriarSessao()));
    }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}



class ColorsThema {

  const ColorsThema();

  static const Color loginGradientStart = const Color(0xff221233);
  static const Color loginGradientEnd = const Color(0xff221233);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
