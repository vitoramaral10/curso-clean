import 'package:curso_clean/validations/protocols/field_validation.dart';
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

class EmailValidation implements FieldValidation {
  @override
  final String field;

  EmailValidation(this.field);

  @override
  String? validate(String? value) {
    final regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
        caseSensitive: false);
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value!);

    return isValid ? null : 'Campo inválido';
  }
}
