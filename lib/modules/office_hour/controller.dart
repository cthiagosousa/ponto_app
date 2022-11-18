import 'package:ponto_app/modules/office_hour/model.dart';
import 'package:ponto_app/modules/office_hour/repository.dart';

class OfficeHourController {
  final IOfficeHourRepository repository;

  const OfficeHourController(this.repository);

  Future<List<OfficeHour>?> fetch(int userID) async {
    try {
      final officeHour = await repository.fetch(userID);
      return officeHour;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<OfficeHour?> register(OfficeHour data) async {
    try {
      final officeHour = await repository.create(data);
      return officeHour;
    } catch (error) {
      throw Exception(error);
    }
  }
}