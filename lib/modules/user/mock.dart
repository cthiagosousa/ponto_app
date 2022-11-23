import 'package:faker/faker.dart';
import 'package:ponto_app/modules/user/model.dart';

class UserMock {
  static User generateUser() {
    final faker = Faker();
    return User(
      name: faker.person.name(),
      email: faker.internet.email(),
      birthDate: faker.date.dateTime(),
    );
  } 
}