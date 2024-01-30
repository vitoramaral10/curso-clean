import '../../../../presentation/protocols/protocols.dart';
import '../../../../validations/protocols/protocols.dart';
import '../../../../validations/validators/validators.dart';

Validation makeLoginValidation() => ValidationComposite(makeLoginValidations());

List<FieldValidation> makeLoginValidations() => [
      const RequiredFieldValidation('email'),
      const EmailValidation('email'),
      const RequiredFieldValidation('password'),
    ];
