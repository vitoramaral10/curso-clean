import 'package:curso_clean/presentation/presenters/stream_login_presenter.dart';
import 'package:curso_clean/presentation/protocols/validation.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ValidationSpy extends Mock implements Validation {}

void main() {
  late StreamLoginPresenter sut;
  late ValidationSpy validation;
  late String email;
  late String password;

  When mockValidationCall({String? field}) => when(() => validation.validate(
      field: field ?? any(named: 'field'), value: any(named: 'value')));

  void mockValidation({String? field, String? value}) {
    mockValidationCall(field: field).thenReturn(value);
  }

  setUp(() {
    validation = ValidationSpy();
    sut = StreamLoginPresenter(validation: validation);
    email = faker.internet.email();
    password = faker.internet.password();

    mockValidation();
  });

  test('Should call Validation with correct email', () async {
    sut.validateEmail(email);

    verify(() => validation.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit email error if validation fails', () {
    mockValidation(value: 'error');

    sut.emailErrorStream.listen(
      expectAsync1(
        (error) => expect(error, 'error'),
      ),
    );
    sut.isFormValidStream.listen(
      expectAsync1(
        (isValid) => expect(isValid, false),
      ),
    );

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit null if validation succeeds', () {
    sut.emailErrorStream.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream.listen(
      expectAsync1((isValid) => expect(isValid, false)),
    );

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should call Validation with correct password', () async {
    sut.validatePassword(password);

    verify(() => validation.validate(field: 'password', value: password))
        .called(1);
  });

  test('Should emit password error if validation fails', () {
    mockValidation(value: 'error');

    sut.passwordErrorStream.listen(
      expectAsync1((error) => expect(error, 'error')),
    );
    sut.isFormValidStream.listen(
      expectAsync1((isValid) => expect(isValid, false)),
    );

    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should emit password error if validation fails', () {
    sut.passwordErrorStream.listen(
      expectAsync1((error) => expect(error, null)),
    );
    sut.isFormValidStream.listen(
      expectAsync1((isValid) => expect(isValid, false)),
    );

    sut.validatePassword(password);
    sut.validatePassword(password);
  });
}
