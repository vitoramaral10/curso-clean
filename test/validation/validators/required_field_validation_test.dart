import 'package:curso_clean/validations/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RequiredFieldValidation sut;

  setUp(() {
    sut = const RequiredFieldValidation('any_field');
  });

  test('Should return null if value is not empty', () {
    expect(sut.validate('any_value'), null);
  });

  test('Should return error if value is empty', () {
    expect(sut.validate(''), 'Campo obrigatório');
  });

  test('Should return error if value is null', () {
    expect(sut.validate(null), 'Campo obrigatório');
  });
}
