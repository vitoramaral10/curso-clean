import 'package:curso_clean/domain/entities/entities.dart';
import 'package:meta/meta.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password,
  });
}
