import 'package:ponto_app/modules/utils/logger.dart';
import 'package:ponto_app/objectbox.g.dart';

abstract class IDB {
    Box<T> box<T>();
    Future<void> init();
}

class DB implements IDB {
  static final DB _instance = DB._();

  factory DB() => _instance;

  DB._();

  late Store _store;

  Store get store => _store;

  @override
  Box<T> box<T>() => _store.box<T>();

  @override
  Future<void> init() async {
    try {
    _store = await openStore();
    logMsg("Database is open!");
    } catch (error, exception) {
      errorMsg("Error on open database", error, exception);
    }
  }
}