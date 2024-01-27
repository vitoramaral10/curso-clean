import 'package:curso_clean/presentation/protocols/validation.dart';
import 'package:curso_clean/validations/protocols/field_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late ValidationComposite sut;
  late FieldValidation validation1;
  late FieldValidation validation2;
  late FieldValidation validation3;

  void mockValidation1(String? error) {
    when(() => validation1.validate(any())).thenReturn(error);
  }

  void mockValidation2(String? error) {
    when(() => validation2.validate(any())).thenReturn(error);
  }

  void mockValidation3(String? error) {
    when(() => validation3.validate(any())).thenReturn(error);
  }

  setUp(() {
    validation1 = FieldValidationSpy();
    when(() => validation1.field).thenReturn('any_field');
    mockValidation1(null);
    validation2 = FieldValidationSpy();
    when(() => validation2.field).thenReturn('any_field');
    mockValidation2(null);
    validation3 = FieldValidationSpy();
    when(() => validation3.field).thenReturn('other_field');
    mockValidation3(null);

    sut = ValidationComposite([validation1, validation2]);
  });

  test('Should return null if all validations returns null or empty', () {
    mockValidation2('');
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
