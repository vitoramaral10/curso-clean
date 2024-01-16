import 'package:curso_clean/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    required this.httpClient,
    required this.url,
  });

  Future<void> auth(AuthenticationParams params) async {
    final body = {
      'email': params.email,
      'password': params.secret,
    };
    await httpClient.request(url: url, method: 'post', body: body);
  }
}

abstract class HttpClient {
  Future<void> request({
    required String url,
    required String method,
    Map? body,
  }) async {}
}

class HttpClientSpy extends Mock implements HttpClient {
  @override
  Future<void> request({
    required String url,
    required String method,
    Map? body,
  }) async {
    super.noSuchMethod(
      Invocation.method(#request, [url, method, body]),
      returnValue: Future.value(),
    );
  }
}

void main() {
  late RemoteAuthentication sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(
      httpClient: httpClient,
      url: url,
    );
  });

  test(
    'Should call HttpClient with correct values',
    () async {
      final params = AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );
      await sut.auth(params);

      verify(
        httpClient.request(
          url: url,
          method: 'post',
          body: {
            'email': params.email,
            'password': params.secret,
          },
        ),
      );
    },
  );
}
