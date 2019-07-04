import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:igor/objetos/rodadaDTO.dart';
import 'package:igor/objetos/sessaoDTO.dart';

final CollectionReference sessaoCollection = Firestore.instance.collection('sessao');
final CollectionReference jogadasCollection = Firestore.instance.collection('jogadas');


class SessaoFirebaseFirestoreService{

  static final SessaoFirebaseFirestoreService _instance = new SessaoFirebaseFirestoreService.internal();
  factory SessaoFirebaseFirestoreService() => _instance;

  SessaoFirebaseFirestoreService.internal();

  Future<void> inserirSessao(String descricao, String dataSessao) async {
    final Sessao usu = new Sessao(descricao, dataSessao);
    final Map<String, dynamic> data = usu.toMap();
    sessaoCollection.add(data);
  }

  Stream<QuerySnapshot> getSessoesList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = sessaoCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<void> inserirJogadas(String descricao) async {
    final Rodada usu = new Rodada(descricao);
    final Map<String, dynamic> data = usu.toMap();
    jogadasCollection.add(data);
  }

  Stream<QuerySnapshot> getNoteList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = jogadasCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }
}