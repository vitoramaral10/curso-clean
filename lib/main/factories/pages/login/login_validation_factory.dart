import '../../../../presentation/protocols/protocols.dart';
import '../../../../validations/protocols/protocols.dart';
import '../../../../validations/validators/validators.dart';
import '../../../builders/builders.dart';

Validation makeLoginValidation() => ValidationComposite(makeLoginValidations());

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
