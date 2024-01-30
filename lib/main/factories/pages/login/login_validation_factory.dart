import 'package:curso_clean/validations/validators/email_validation.dart';
import 'package:curso_clean/validations/validators/required_field_validation.dart';
import 'package:curso_clean/validations/validators/validation_composite.dart';

import '../../../../presentation/protocols/validation.dart';

Validation makeLoginValidation() => ValidationComposite([
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
    ]);
