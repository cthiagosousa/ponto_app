import 'package:ponto_app/modules/interfaces/http_service.dart';
import 'package:ponto_app/modules/office_hour/model.dart';
import 'package:ponto_app/modules/utils/logger.dart';

abstract class IOfficeHourRepository {
  Future<List<OfficeHour>> fetch(int userID);
  Future<OfficeHour> create(OfficeHour data);
  Future<OfficeHour> update(OfficeHour data);
  Future<OfficeHour> delete(int id);
}

class OfficeHourRepositoryImp implements IOfficeHourRepository {
  final HttpService client;

  const OfficeHourRepositoryImp(this.client);

  @override
  Future<List<OfficeHour>> fetch(int userID) async {
    try {
      final response = await client.get({"path": "/office-hours/$userID"});
      if(response.success) {
        if(response.data is List) {
          final data = (response.data as List).map((e) => OfficeHour.fromMap(e));
          return data.toList();
        }
        return [];
      } else {
        return Future.error(response.errorMessage!);
      }
    } catch (error, exception) {
      errorMsg("GET OfficeHour Method Error", error, exception);
      rethrow;
    }
  }

  @override
  Future<OfficeHour> create(OfficeHour data) async {
    try {
      final response = await client.post({"path": "/office-hours", "data": data.toMap()});
      if(response.success) {
        final data = OfficeHour.fromMap(response.data);
        return data;
      } else {
        return Future.error(response.errorMessage!);
      }
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
