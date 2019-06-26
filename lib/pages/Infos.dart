import 'package:flutter/material.dart';
import 'package:igor/pages/menu.personagens.dart';

class InfosPage extends StatefulWidget {
  bool visBotoes;
  InfosPage(this.visBotoes);
  @override
  _InfosPageState createState() => _InfosPageState(this.visBotoes);
}

class _InfosPageState extends State<InfosPage> {
  @override

  bool b;
  _InfosPageState(this.b);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("lib/images/background.png"),
              fit: BoxFit.fill)),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Divider(height: 50, color: Colors.transparent),
                      Image.asset(
                      'lib/images/igor_icon.png',
                      width: 200,
                      height: 60,
                      fit: BoxFit.fill,
                      ),
                      Divider(height: 30, color: Colors.transparent),
                      Text(
                      "COMO JOGAR",
                      style: TextStyle(
                      fontSize: 40, color: Color(0xff221233), fontWeight: FontWeight.bold),
                      ),
                      Divider(height: 20, color: Colors.transparent),
                      Text(
                      "1 - O mestre da aventura deve definir a ordem em que cada jogador ficará na mesa\n\n"
                      "2 - Em sua vez, defina quem será o jogador que você irá atacar\n\n"
                      "3 - Você rolará o dado e os pontos obtidos, juntamente com as modificações "
                      "causadas pela habilidade do seu personagem e/ou do personagem do seu adversário, "
                      "serão subtraídos dos pontos de vida do seu adversário\n",
                      style: TextStyle(
                      fontSize: 20, color: Colors.amber[100], fontWeight: FontWeight.bold),
                      ),
                      Divider(height: 30, color: Colors.transparent),
                      Text(
                      "OBJETIVOS",
                      style: TextStyle(
                      fontSize: 40, color: Color(0xff221233), fontWeight: FontWeight.bold),
                      ),
                      Divider(height: 20, color: Colors.transparent),
                      Text(
                      "O objetivo do jogo é zerar a vida de todos os demais participantes da aventura, "
                      "cada jogador terá seu próprio personagem, e cada personagem, por sua vez, "
                      "tem habilidades únicas.",
                      style: TextStyle(
                      fontSize: 20, color: Colors.amber[100], fontWeight: FontWeight.bold),
                      ),
                      Divider(height: 30, color: Colors.transparent),
                      Text(
                        "PERSONAGENS",
                        style: TextStyle(
                            fontSize: 40, color: Color(0xff221233), fontWeight: FontWeight.bold),
                      ),
                      Divider(height: 20, color: Colors.transparent),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.amber[100],
                        child: Text(
                          "Página de personagens",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff221233)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuPersonagemPage(b)),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
          );
        },
      ),
    );
  }
}