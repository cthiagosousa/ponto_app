// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'modules/office_hour/model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 588471438681103995),
      name: 'Break',
      lastPropertyId: const IdUid(4, 4025740495620671425),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6741837046840146099),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5446723605621077852),
            name: 'officeHour',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1064095462092133700),
            name: 'start',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4025740495620671425),
            name: 'end',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 709503384219744845),
      name: 'OfficeHour',
      lastPropertyId: const IdUid(7, 6785063191824203518),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2909714573970890562),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6195011514762828137),
            name: 'user',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3896676945277011012),
            name: 'day',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7343655802359083422),
            name: 'entryTime',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8434468576264937043),
            name: 'exitTime',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 879256262153196617),
            name: 'overtime',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6785063191824203518),
            name: 'totalAmountHours',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 709503384219744845),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Break: EntityDefinition<Break>(
        model: _entities[0],
        toOneRelations: (Break object) => [],
        toManyRelations: (Break object) => {},
        getId: (Break object) => object.id,
        setId: (Break object, int id) {
          object.id = id;
        },
        objectToFB: (Break object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.officeHour);
          fbb.addInt64(2, object.start?.millisecondsSinceEpoch);
          fbb.addInt64(3, object.end?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final startValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final endValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final object = Break(
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              officeHour: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              start: startValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(startValue),
              end: endValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(endValue));

          return object;
        }),
    OfficeHour: EntityDefinition<OfficeHour>(
        model: _entities[1],
        toOneRelations: (OfficeHour object) => [],
        toManyRelations: (OfficeHour object) => {},
        getId: (OfficeHour object) => object.id,
        setId: (OfficeHour object, int id) {
          object.id = id;
        },
        objectToFB: (OfficeHour object, fb.Builder fbb) {
          fbb.startTable(8);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.user);
          fbb.addInt64(2, object.day?.millisecondsSinceEpoch);
          fbb.addInt64(3, object.entryTime?.millisecondsSinceEpoch);
          fbb.addInt64(4, object.exitTime?.millisecondsSinceEpoch);
          fbb.addInt64(5, object.overtime?.millisecondsSinceEpoch);
          fbb.addInt64(6, object.totalAmountHours?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dayValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final entryTimeValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final exitTimeValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final overtimeValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final totalAmountHoursValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16);
          final object = OfficeHour(
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              user: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              day: dayValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(dayValue),
              entryTime: entryTimeValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(entryTimeValue),
              exitTime: exitTimeValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(exitTimeValue),
              overtime: overtimeValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(overtimeValue),
              totalAmountHours: totalAmountHoursValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(totalAmountHoursValue));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Break] entity fields to define ObjectBox queries.
class Break_ {
  /// see [Break.id]
  static final id = QueryIntegerProperty<Break>(_entities[0].properties[0]);

  /// see [Break.officeHour]
  static final officeHour =
      QueryIntegerProperty<Break>(_entities[0].properties[1]);

  /// see [Break.start]
  static final start = QueryIntegerProperty<Break>(_entities[0].properties[2]);

  /// see [Break.end]
  static final end = QueryIntegerProperty<Break>(_entities[0].properties[3]);
}

/// [OfficeHour] entity fields to define ObjectBox queries.
class OfficeHour_ {
  /// see [OfficeHour.id]
  static final id =
      QueryIntegerProperty<OfficeHour>(_entities[1].properties[0]);

  /// see [OfficeHour.user]
  static final user =
      QueryIntegerProperty<OfficeHour>(_entities[1].properties[1]);

  /// see [OfficeHour.day]
  static final day =
      QueryIntegerProperty<OfficeHour>(_entities[1].properties[2]);

  /// see [OfficeHour.entryTime]
  static final entryTime =
      QueryIntegerProperty<OfficeHour>(_entities[1].properties[3]);

  /// see [OfficeHour.exitTime]
  static final exitTime =
      QueryIntegerProperty<OfficeHour>(_entities[1].properties[4]);

  /// see [OfficeHour.overtime]
  static final overtime =
      QueryIntegerProperty<OfficeHour>(_entities[1].properties[5]);

  /// see [OfficeHour.totalAmountHours]
  static final totalAmountHours =
      QueryIntegerProperty<OfficeHour>(_entities[1].properties[6]);
}