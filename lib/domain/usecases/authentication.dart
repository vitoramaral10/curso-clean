import 'package:curso_clean/domain/entities/entities.dart';
import 'package:meta/meta.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({@required this.email, @required this.secret});
}
