import 'package:curso_clean/presentation/protocols/validation.dart';
import 'package:curso_clean/validations/protocols/field_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  test('Should return null if all validations returns null or empty', () {
    final validation1 = FieldValidationSpy();
    final validation2 = FieldValidationSpy();
    when(() => validation1.field).thenReturn('other_field');
    when(() => validation1.validate(any())).thenReturn('error_1');
    when(() => validation2.field).thenReturn('any_field');
    when(() => validation2.validate(any())).thenReturn(null);

    final sut = ValidationComposite([validation1, validation2]);
    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
}

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  @override
  String? validate({required String field, String? value}) {
    return null;
  }
}

class FieldValidationSpy extends Mock implements FieldValidation {}
