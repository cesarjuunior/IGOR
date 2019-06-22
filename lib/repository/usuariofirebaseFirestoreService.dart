import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:igor/objetos/usuarioDTO.dart';

final CollectionReference usuCollection = Firestore.instance.collection('usuario');

class UsuarioFirebaseFirestoreService{

  static final UsuarioFirebaseFirestoreService _instance = new UsuarioFirebaseFirestoreService.internal();
  factory UsuarioFirebaseFirestoreService() => _instance;

  UsuarioFirebaseFirestoreService.internal();

  Future<Usuario> inserirUsuario(String email, String nome, String dtnasci, String senha, String sexo) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(usuCollection.document());

      final Usuario usu = new Usuario(nome, email, senha, dtnasci, sexo);
      final Map<String, dynamic> data = usu.toMap();


      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Usuario.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }
}