import 'package:ponto_app/modules/utils/dateformat.dart';

class User {
  String? id;
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
    String? id,
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
      id: map["id"],
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      birthDate: map['birthDate'] != null ? dateFormat(map['birthDate']) : null,
    );
  }

  factory User.fromFirebaseAuth(Map<String, dynamic> map) {
    return User();
  }
}
