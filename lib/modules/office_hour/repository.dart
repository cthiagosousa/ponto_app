import 'package:ponto_app/modules/interfaces/http_service.dart';
import 'package:ponto_app/modules/office_hour/model.dart';
import 'package:ponto_app/modules/services/database/db.dart';
import 'package:ponto_app/modules/utils/logger.dart';
import 'package:ponto_app/objectbox.g.dart';

abstract class IOfficeHourRepository {
  Future<List<OfficeHour>> fetch(int userID);
  Future<OfficeHour> create(OfficeHour data);
  Future<OfficeHour> update(OfficeHour data);
  Future<OfficeHour> delete(int id);
}

class OfficeHourRepositoryImp implements IOfficeHourRepository {
  final HttpService client;
  final IDB db;

  const OfficeHourRepositoryImp(this.client, this.db);

  Box<OfficeHour> get box => db.box<OfficeHour>();

  @override
  Future<List<OfficeHour>> fetch(int userID) async {
    try {
      final response = await client.get("/office-hours/$userID");
      if(response.data is List) {
        final data = (response.data as List).map((e) => OfficeHour.fromMap(e));
        return data.toList();
      }
      return [];
    } catch (error, exception) {
      errorMsg("GET OfficeHour Method Error", error, exception);
      rethrow;
    }
  }

  @override
  Future<OfficeHour> create(OfficeHour hour) async {
    try {
      final response = await client.post("/office-hours", data: hour.toMap());
      final data = OfficeHour.fromMap(response.data);
      return data;
    } catch (error, exception) {
      errorMsg("CREATE OfficeHour Method Error", error, exception);
      rethrow;
    }
  }

  @override
  Future<OfficeHour> update(OfficeHour data) {
    throw UnimplementedError();
  }

  @override
  Future<OfficeHour> delete(int id) {
    throw UnimplementedError();
  }
}
