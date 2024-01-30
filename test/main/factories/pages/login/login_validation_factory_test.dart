import 'package:curso_clean/main/factories/factories.dart';
import 'package:curso_clean/validations/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the correct validations', () {
    final validations = makeLoginValidations();

    expect(validations, [
      const RequiredFieldValidation('email'),
      const EmailValidation('email'),
      const RequiredFieldValidation('password'),
    ]);
  });
}
