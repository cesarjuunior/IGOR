import 'package:flutter/material.dart';
import 'package:igor/objetos/notice.dart';
import 'package:igor/pages/criar.aventura.dart';
import 'package:igor/repository/newsApi.dart';
import 'package:igor/pages/Infos.dart';
import 'cadastro.pessoa.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _news = new List();
  var repository = new NewsApi();

  @override
  bool visBotoesPer = false;
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
        child: _getListViewWidget(),
      ),
    );
  }

  @override
  void initState() {

    loadNotices();

  }

  loadNotices() async{

    List result = await repository.loadNews();

    setState(() {

      result.forEach((item) {

        var notice = new Notice(
            item['id'],
            item['url_img'],
            item['tittle'],
            item['date'],
            item['description']
        );


        _news.add(notice);

      });

    });

  }



   _getListViewWidget(){
     var list = new ListView.builder(
         itemCount: _news.length,
         padding: new EdgeInsets.only(top: 5.0),
         itemBuilder: (context, index){
           return _news[index];
         }
     );

     return list;
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
