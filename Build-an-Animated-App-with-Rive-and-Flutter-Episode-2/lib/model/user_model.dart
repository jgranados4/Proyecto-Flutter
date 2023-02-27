List<UserModel> userFromJson(dynamic str) =>
    List<UserModel>.from((str).map((x) => UserModel.fromJson(x)));

class UserModel {
  late int? id;
  late String? nombre;
  late String? cedula;
  late String? direccion;
  late String? username;
  late String? password;

  UserModel({this.id, this.nombre, this.cedula,this.direccion, this.username, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    cedula = json['cedula'];
    direccion = json['direccion'];
    username = json['username'];
    password = json['password'];
  }
// Transforma a un
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['cedula'] = cedula;
    _data['direccion'] = direccion;
    _data['username'] = username;
    _data['password'] = password;
    return _data;
  }
  /*Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'edad': edad, 'email': email};
  }*/
}
