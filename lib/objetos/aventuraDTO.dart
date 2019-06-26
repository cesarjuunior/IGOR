class Aventura {

  String _id;
  String _descricaoAventura;
  String _imagemTema;


  Aventura(this._descricaoAventura, this._imagemTema);

  Aventura.map(dynamic obj) {
    this._id = obj['id'];
    this._descricaoAventura = obj['descricaoAventura'];
    this._imagemTema = obj['imagemTema'];

  }

  String get id => _id;
  String get descricaoAventura => _descricaoAventura;
  String get imagemTema => _imagemTema;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['descricaoAventura'] = _descricaoAventura;
    map['imagemTema'] = _imagemTema;

    return map;
  }

  Aventura.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._descricaoAventura = map['descricaoAventura'];
    this._imagemTema = map['imagemTema'];

  }
}