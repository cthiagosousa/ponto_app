import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ponto_app/modules/services/locator.dart';
import 'package:ponto_app/modules/user/controller.dart';
import 'package:ponto_app/modules/user/model.dart';

void main() {
  setUpAll(() async {
    setupLocator();
    await initializeDateFormatting();
  });  

  group("CRUD User", () {
    test("Create a new user", () async {
      final faker = Faker();
      final controller = Get.find<UserController>();
      final data = User(
        name: faker.person.name(),
        email: faker.internet.email(),
        birthDate: faker.date.dateTime(),
      );
      final newUser = await controller.register(data);
      expect(newUser != null, true);
    });

    test("Get user details", () async {
      final controller = Get.find<UserController>();
      final user = await controller.details(1);
      expect(user != null, true);
    });
  });
}