import 'package:flutter/material.dart';
import 'package:igor/pages/aventura_andamento.dart';

class Notice extends StatelessWidget{

  var _id;
  var _img;
  var _title;
  var _date;
  var _description;

  Notice(this._id, this._img,this._title,this._date,this._description);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    //Foi adicionado dentro de Container para adicionar margem no item
    return new Container(
      margin: const EdgeInsets.only(left: 0, right: 0,bottom: 2,top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: InkWell(
          onTap: (){
            print("APERTEI O BOTÃO PARA IR A OUTRA TELA");
            print(_id);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AventuraAndamento()),
            );
          },
          child: _getListTile(),
        )
      ),
    );
  }

  Widget _getListTile(){

    // Foi adicionado dentro de Container para adicionar altura fixa.
    return new Container(
      height: 95.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/miniatura_coast.png"),
              fit: BoxFit.fill)),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
/*          new FadeInImage.assetNetwork(
            placeholder: '',
            image: _img,
            fit: BoxFit.cover,
            width: 95.0,
            height: 95.0,
          ),*/
          _getColumText(_title,_date,_description),
        ],

      ),
    );

  }

  Widget _getColumText(tittle,date, description){

    return new Expanded(
        child: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              _getTitleWidget(_title)],
/*              _getDateWidget(_date),
              _getDescriptionWidget(_description)],*/
          ),
        )
    );
  }

  Widget _getTitleWidget(String curencyName){
    return new Text(
      curencyName,
      maxLines: 1,
      style: new TextStyle(fontFamily: 'Fira Sans',
                           color: Colors.white,
                           fontSize: 20),
    );
  }

/*  Widget _getDescriptionWidget(String description){
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(description,maxLines: 2,),
    );
  }*/

/*  Widget _getDateWidget(String date){
    return new Text(date,
      style: new TextStyle(color: Colors.grey,fontSize: 10.0),);
  }*/

}