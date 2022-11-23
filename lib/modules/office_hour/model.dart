import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:ponto_app/modules/utils/dateformat.dart';

@Entity()
class OfficeHour {
  int? id;
  int? user;
  @Property(type: PropertyType.date)
  DateTime? day;
  @Property(type: PropertyType.date)
  DateTime? entryTime;
  @Property(type: PropertyType.date)
  DateTime? exitTime;
  @Property(type: PropertyType.date)
  DateTime? overtime;
  @Property(type: PropertyType.date)
  DateTime? totalAmountHours;
  List<Break>? breaks;

  OfficeHour({
    this.id,
    this.user,
    this.day,
    this.entryTime,
    this.exitTime,
    this.overtime,
    this.totalAmountHours,
    this.breaks,
  });

  OfficeHour copyWith({
    int? id,
    int? user,
    DateTime? day,
    DateTime? entryTime,
    DateTime? exitTime,
    DateTime? overtime,
    DateTime? totalAmountHours,
    List<Break>? breaks,
  }) {
    return OfficeHour(
      id: id ?? this.id,
      user: user ?? this.user,
      day: day ?? this.day,
      entryTime: entryTime ?? this.entryTime,
      exitTime: exitTime ?? this.exitTime,
      overtime: overtime ?? this.overtime,
      totalAmountHours: totalAmountHours ?? this.totalAmountHours,
      breaks: breaks ?? this.breaks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'day': day != null ? dateToString(day!) : null,
      'entry_time': entryTime != null ? dateToString(entryTime!) : null,
      'exit_time': exitTime != null ? dateToString(exitTime!) : null,
      'overtime': overtime != null ? dateToString(overtime!) : null,
      'total_amount_hours': totalAmountHours != null ? dateToString(totalAmountHours!) : null,
      'breaks': breaks?.map((x) => x.toMap()).toList(),
    };
  }

  factory OfficeHour.fromMap(Map<String, dynamic> map) {
    return OfficeHour(
      id: map['id'] != null ?  int.parse(map['id']) : null,
      user: map['user'],
      day: map['day'] != null ? dateFormat(map['day']) : null,
      entryTime: map['entry_time'] != null ? dateFormat(map['entry_time']) : null,
      exitTime: map['exit_time'] != null ? dateFormat(map['exit_time']) : null,
      overtime: map['overtime'] != null ? dateFormat(map['overtime']) : null,
      totalAmountHours: map['total_amount_hours'] != null ? dateFormat(map['total_amount_hours']) : null,
      breaks: map['breaks'] != null 
        ? List<Break>.from((map['breaks']).map((x) => Break.fromMap(x))) 
        : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeHour.fromJson(String source) => OfficeHour.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfficeHour(id: $id, user: $user, day: $day, entryTime: $entryTime, exitTime: $exitTime, overtime: $overtime, totalAmountHours: $totalAmountHours, breaks: $breaks)';
  }

  @override
  bool operator ==(covariant OfficeHour other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user == user &&
      other.day == day &&
      other.entryTime == entryTime &&
      other.exitTime == exitTime &&
      other.overtime == overtime &&
      other.totalAmountHours == totalAmountHours &&
      listEquals(other.breaks, breaks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user.hashCode ^
      day.hashCode ^
      entryTime.hashCode ^
      exitTime.hashCode ^
      overtime.hashCode ^
      totalAmountHours.hashCode ^
      breaks.hashCode;
  }
}

@Entity()
class Break {
  int? id;
  int? officeHour;
  @Property(type: PropertyType.date)
  DateTime? start;
  @Property(type: PropertyType.date)
  DateTime? end;

  Break({
    this.id,
    this.officeHour,
    this.start,
    this.end,
  });

  Break copyWith({
    int? id,
    int? officeHour,
    DateTime? start,
    DateTime? end,
  }) {
    return Break(
      id: id ?? this.id,
      officeHour: officeHour ?? this.officeHour,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'office_hour': officeHour,
      'start': start != null ? dateToString(start!) : null,
      'end': end != null ? dateToString(end!) : null,
    };
  }

  factory Break.fromMap(Map<String, dynamic> map) {
    return Break(
      id: map['id'],
      officeHour: map['office_hour'],
      start: map['start'] != null ? dateFormat(map['start']) : null,
      end: map['end'] != null ? dateFormat(map['end']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Break.fromJson(String source) => Break.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Break(id: $id, officeHour: $officeHour, start: $start, end: $end)';
  }

  @override
  bool operator ==(covariant Break other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.officeHour == officeHour &&
      other.start == start &&
      other.end == end;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      officeHour.hashCode ^
      start.hashCode ^
      end.hashCode;
  }
}
