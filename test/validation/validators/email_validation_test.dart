import 'package:curso_clean/validations/validators/email_validation.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });
  test('Should return null if email is empty', () {
    expect(sut.validate(''), null);
  });

  test('Should return null if email is null', () {
    expect(sut.validate(null), null);
  });

  test('Should return null if email is valid', () {
    final email = faker.internet.email();
    expect(sut.validate(email), null);
  });

  test('Should return error if email is invalid', () {
    expect(sut.validate('any_value'), 'Campo inválido');
  });
}
