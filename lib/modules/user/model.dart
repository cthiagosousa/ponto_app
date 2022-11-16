import 'dart:convert';

import 'package:ponto_app/modules/utils/dateformat.dart';

class User {
  int? id;
  String? name;
  String? email;
  DateTime? birthDate;
  
  User({
    this.id,
    this.name,
    this.email,
    this.birthDate,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? birthDate,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'birth_date': dateToString(birthDate!),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: int.parse(map["id"]),
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      birthDate: map['birthDate'] != null ? dateFormat(map['birthDate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, birthDate: $birthDate)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.birthDate == birthDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      birthDate.hashCode;
  }
}
