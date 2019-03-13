import 'package:microsoft_graph/microsoft_graph.dart';

import 'authentication_provider.dart';
import 'http_provider.dart';

class SimpleHttpClient implements IHttpClient {

  final String accessToken;

  SimpleHttpClient(this.accessToken);

  @override
  IAuthenticationProvider get authenticationProvider => AuthenticationProvider(accessToken);

  @override
  IHttpProvider get httpProvider => HttpProvider();
}