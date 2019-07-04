class Sessao{
  String _id;
  String _descricaoSessao;
  String _data;


  Sessao(this._descricaoSessao, this._data);

  Sessao.map(dynamic obj) {
    this._id = obj['id'];
    this._descricaoSessao = obj['descricaoAventura'];
    this._data = obj['imagemTema'];

  }

  String get id => _id;
  String get descricaoSessao => _descricaoSessao;
  String get data => _data;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['descricaoSessao'] = _descricaoSessao;
    map['data'] = _data;

    return map;
  }

  Sessao.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._descricaoSessao = map['descricaoSessao'];
    this._data = map['data'];

  }
}