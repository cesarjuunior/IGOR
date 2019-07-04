class Rodada{
  String _id;
  String _jogada;


  Rodada(this._jogada);

  Rodada.map(dynamic obj) {
    this._id = obj['id'];
    this._jogada = obj['jogada'];
  }

  String get id => _id;
  String get jogada => _jogada;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['jogada'] = _jogada;

    return map;
  }

  Rodada.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._jogada = map['jogada'];
  }
}