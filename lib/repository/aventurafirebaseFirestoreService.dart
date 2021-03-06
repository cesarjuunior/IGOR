import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:igor/objetos/aventuraDTO.dart';

final CollectionReference avenCollection = Firestore.instance.collection('aventura');

class AventuraFirebaseFirestoreService{

  static final AventuraFirebaseFirestoreService _instance = new AventuraFirebaseFirestoreService.internal();
  factory AventuraFirebaseFirestoreService() => _instance;

  AventuraFirebaseFirestoreService.internal();

  Future<Aventura> inserirAventura(String descricaoAventura, String imagemTema) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(avenCollection.document());

      final Aventura usu = new Aventura(descricaoAventura, imagemTema);
      final Map<String, dynamic> data = usu.toMap();


      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Aventura.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }


  Stream<QuerySnapshot> getNoteList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = avenCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }
}