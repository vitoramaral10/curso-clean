import 'package:curso_clean/domain/helpers/helpers.dart';
import 'package:curso_clean/domain/usecases/usecases.dart';
import 'package:curso_clean/presentation/presenters/presenters.dart';
import 'package:curso_clean/presentation/protocols/protocols.dart';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ValidationSpy extends Mock implements Validation {}

class AuthenticationSpy extends Mock implements Authentication {}

void main() {
  late GetxLoginPresenter sut;
  late AuthenticationSpy authentication;
  late ValidationSpy validation;
  late String email;
  late String password;

  When mockValidationCall({String? field}) => when(() => validation.validate(
      field: field ?? any(named: 'field'), value: any(named: 'value')));

  When mockAuthenticationCall() => when(() => authentication.auth(any()));

  void mockValidation({String? field, String? value}) {
    mockValidationCall(field: field).thenReturn(value);
  }

  void mockAuthenticationError(DomainError error) {
    mockAuthenticationCall().thenThrow(error);
  }

  setUp(() {
    email = faker.internet.email();
    password = faker.internet.password();
    validation = ValidationSpy();
    authentication = AuthenticationSpy();
    sut = GetxLoginPresenter(
      validation: validation,
      authentication: authentication,
    );
  });

  test('Should call Validation with correct email', () {
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
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should call Validation with correct password', () {
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

  // test('Should emit correct events on Authentication success', () async {
  //   sut.validateEmail(email);
  //   sut.validatePassword(password);

  //   expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

  //   await sut.auth();
  // });

  // test('Should emit correct events on InvalidCredentialsError', () async {
  //   mockAuthenticationError(DomainError.invalidCredentials);
  //   sut.validateEmail(email);
  //   sut.validatePassword(password);

  //   expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
  //   sut.mainErrorStream.listen(
  //       expectAsync1((error) => expect(error, 'Credenciais inválidas.')));

  //   await sut.auth();
  // });

  // test('Should emit correct events on UnexpectedError', () async {
  //   mockAuthenticationError(DomainError.unexpected);
  //   sut.validateEmail(email);
  //   sut.validatePassword(password);

  //   expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
  //   sut.mainErrorStream.listen(
  //       expectAsync1((error) => expect(error, 'Algo errado aconteceu. Tente novamente em breve.')));

  //   await sut.auth();
  // });

  // test('Should emit invalidFieldError if email is invalid', () {
  //   sut.emailErrorStream
  //       .listen(expectAsync1((error) => expect(error, UIError.invalidField)));
  //   sut.isFormValidStream
  //       .listen(expectAsync1((isValid) => expect(isValid, false)));

  //   sut.validateEmail(email);
  //   sut.validateEmail(email);
  // });

  // test('Should emit requiredFieldError if email is empty', () {
  //   sut.emailErrorStream
  //       .listen(expectAsync1((error) => expect(error, UIError.requiredField)));
  //   sut.isFormValidStream
  //       .listen(expectAsync1((isValid) => expect(isValid, false)));

  //   sut.validateEmail(email);
  //   sut.validateEmail(email);
  // });

  // test('Should emit requiredFieldError if password is empty', () {
  //   sut.passwordErrorStream
  //       .listen(expectAsync1((error) => expect(error, UIError.requiredField)));
  //   sut.isFormValidStream
  //       .listen(expectAsync1((isValid) => expect(isValid, false)));

  //   sut.validatePassword(password);
  //   sut.validatePassword(password);
  // });

  // test('Should emit null if validation succeeds', () {
  //   sut.passwordErrorStream
  //       .listen(expectAsync1((error) => expect(error, null)));
  //   sut.isFormValidStream
  //       .listen(expectAsync1((isValid) => expect(isValid, false)));

  //   sut.validatePassword(password);
  //   sut.validatePassword(password);
  // });

  // test('Should disable form button if any field is invalid', () {
  //   sut.isFormValidStream
  //       .listen(expectAsync1((isValid) => expect(isValid, false)));

  //   sut.validateEmail(email);
  //   sut.validatePassword(password);
  // });

  // test('Should enable form button if all fields are valid', () async {
  //   expectLater(sut.isFormValidStream, emitsInOrder([false, true]));

  //   sut.validateEmail(email);
  //   await Future.delayed(Duration.zero);
  //   sut.validatePassword(password);
  // });

  // test('Should call Authentication with correct values', () async {
  //   sut.validateEmail(email);
  //   sut.validatePassword(password);

  //   await sut.auth();

  //   verify(() => authentication
  //       .auth(AuthenticationParams(email: email, secret: password))).called(1);
  // });

  // test('Should emit UnexpectedError if SaveCurrentAccount fails', () async {
  //   sut.validateEmail(email);
  //   sut.validatePassword(password);

  //   expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
  //   expectLater(sut.mainErrorStream, emitsInOrder([null, UIError.unexpected]));

  //   await sut.auth();
  // });

  // test('Should emit correct events on InvalidCredentialsError', () async {
  //   sut.validateEmail(email);
  //   sut.validatePassword(password);

  //   expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
  //   expectLater(
  //       sut.mainErrorStream, emitsInOrder([null, UIError.invalidCredentials]));

  //   await sut.auth();
  // });

  // test('Should emit correct events on UnexpectedError', () async {
  //   sut.validateEmail(email);
  //   sut.validatePassword(password);

  //   expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
  //   expectLater(sut.mainErrorStream, emitsInOrder([null, UIError.unexpected]));

  //   await sut.auth();
  // });
}
