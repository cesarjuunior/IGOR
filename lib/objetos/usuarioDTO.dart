class Usuario {

  String _id;
  String _nome;
  String _email;
  String _senha;
  String _dataNascimento;
  String _sexo;

  Usuario(this._nome, this._email, this._senha, this._dataNascimento, this._sexo);

  Usuario.map(dynamic obj) {
    this._id = obj['id'];
    this._nome = obj['nome'];
    this._email = obj['email'];
    this._senha = obj['senha'];
    this._dataNascimento = obj['dataNascimento'];
    this._sexo = obj['sexo'];
  }

  String get id => _id;
  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;
  String get dataNascimento => _dataNascimento;
  String get sexo => _sexo;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['nome'] = _nome;
    map['email'] = _email;
    map['senha'] = _senha;
    map['dataNascimento'] = _dataNascimento;
    map['sexo'] = _sexo;

    return map;
  }

  Usuario.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nome = map['nome'];
    this._email = map['email'];
    this._senha = map['senha'];
    this._dataNascimento = map['dataNascimento'];
    this._sexo = map['sexo'];
  }
}