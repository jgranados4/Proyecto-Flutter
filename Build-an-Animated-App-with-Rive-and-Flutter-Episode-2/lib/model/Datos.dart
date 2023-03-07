List<UserModelA> userFromJsonA(dynamic str) =>
    List<UserModelA>.from((str).map((x) => UserModelA.fromJson(x)));

class UserModelA {
  late int? id;
  late String? solicitud;
  late String? estado;
  late DateTime? fecha;
  late String? bloque;
  late String? aula;

  UserModelA(
      {this.id,
      this.solicitud,
      this.estado,
      this.fecha,
      this.bloque,
      this.aula});

  UserModelA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    solicitud = json['solicitud'];
    estado = json['estado'];
    fecha = json['fecha'];
    bloque = json['bloque'];
    aula = json['aula'];
  }
// Transforma a un
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['solicitud'] = solicitud;
    _data['estado'] = estado;
    _data['fecha'] = fecha;
    _data['bloque'] = bloque;
    _data['aula'] = aula;
    return _data;
  }
  /*Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'edad': edad, 'email': email};
  }*/
}
