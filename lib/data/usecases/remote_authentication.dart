import 'package:curso_clean/data/http/http.dart';
import 'package:curso_clean/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    await httpClient.request(
      url: url,
      method: 'post',
      body: params.toJson(),
    );
  }
}
