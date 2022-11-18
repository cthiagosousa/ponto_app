import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ponto_app/modules/office_hour/controller.dart';
import 'package:ponto_app/modules/office_hour/model.dart';
import 'package:ponto_app/modules/services/locator.dart';

void main() {
  setUpAll(() async {
    setupLocator();
    await initializeDateFormatting();
  });  

  group("CRUD OfficeHour", () {
    test("Create a new office hour", () async {
      final faker = Faker();
      final controller = Get.find<OfficeHourController>();
      final data = OfficeHour(
        user: 1,
        day: faker.date.dateTime(),
        entryTime: faker.date.dateTime(),
        exitTime: faker.date.dateTime(),
        overtime: faker.date.dateTime(),
        totalAmountHours: faker.date.dateTime(),
        breaks: [
          Break(
            id: faker.randomGenerator.integer(99999),
            officeHour: 1,
            start: faker.date.dateTime(),
            end: faker.date.dateTime(),
          ),
        ],
      );
      final newOfficeHour = await controller.register(data);
      expect(newOfficeHour != null, true);
    });

    /* test("Get user details", () async {
      final controller = Get.find<OfficeHourController>();
      final user = await controller.fetch(1);
      expect(user != null, true);
    }); */
  });
}