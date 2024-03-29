import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';

class EmailValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const EmailValidation(this.field);

  @override
  String? validate(String? value) {
    final regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
        caseSensitive: false);
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value!);

    return isValid ? null : 'Campo inválido';
  }
}
