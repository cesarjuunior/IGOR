import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:igor/objetos/usuarioDTO.dart';
import 'package:igor/pages/home.dart';

final CollectionReference usuCollection = Firestore.instance.collection('usuario');
final CollectionReference aventuraCollection = Firestore.instance.collection('aventura');

class UsuarioFirebaseFirestoreService{

  static final UsuarioFirebaseFirestoreService _instance = new UsuarioFirebaseFirestoreService.internal();
  factory UsuarioFirebaseFirestoreService() => _instance;

  UsuarioFirebaseFirestoreService.internal();

  QuerySnapshot usuarios;

  Future<void> inserirUsuario(String email, String nome, String dtnasci, String senha, String sexo) async {

      final Usuario usu = new Usuario(nome, email, senha, dtnasci, sexo);
      final Map<String, dynamic> data = usu.toMap();

      usuCollection.add(data);
  }

  recuperarUsuario(String email, String senha, BuildContext context ) async {
   usuCollection.getDocuments().then((result) {
      usuarios = result;
      return validarUsuario(usuarios, email, senha, context);
    });
  }
}

bool validarUsuario(QuerySnapshot usuarios, String email, String senha, BuildContext context){

  bool achou = false;
  for(int i = 0; i < usuarios.documents.length; i++){
          if(usuarios.documents[i].data["email"].toString().trim() == email.trim() &&
              usuarios.documents[i].data["senha"].toString().trim() == senha.trim()){
              achou = true;
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
      }

  if(achou == false){
// flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Eiiii jovenx, parece que você não possui cadastro!!"),
          content: new Text("Vá em CRIAR CONTA na tela inicial e cadastre-se."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Voltar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}