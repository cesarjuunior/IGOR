class Aventura {

  String _id;
  String _descricaoAventura;

  Aventura(this._descricaoAventura);

  Aventura.map(dynamic obj) {
    this._id = obj['id'];
    this._descricaoAventura = obj['descricaoAventura'];
  }

  String get id => _id;
  String get nome => _descricaoAventura;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['descricaoAventura'] = _descricaoAventura;

    return map;
  }

  Aventura.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._descricaoAventura = map['descricaoAventura'];
  }
}