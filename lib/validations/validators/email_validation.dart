import 'package:curso_clean/validations/protocols/field_validation.dart';

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
