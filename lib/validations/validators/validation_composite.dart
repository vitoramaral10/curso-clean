import 'package:curso_clean/presentation/protocols/validation.dart';
import 'package:curso_clean/validations/protocols/field_validation.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  @override
  String? validate({required String field, String? value}) {
    for (final validation in validations.where((v) => v.field == field)) {
      final error = validation.validate(value);
      if (error?.isNotEmpty == true) {
        return error;
      }
    }
    return null;
  }

  @override
  String get field => '';
}
