import 'dart:async';

import 'package:microsoft_graph/microsoft_graph.dart';

class AuthenticationProvider implements IAuthenticationProvider {

  final String accessToken;

  AuthenticationProvider(this.accessToken);

  @override
  Future<HttpRequestMessage> authenticateRequest(HttpRequestMessage request) async {
    final List<HttpHeader> headers = request.headers;
    headers.add(HttpHeader("Authorization", "Bearer $accessToken"));
    return HttpRequestMessage(request.httpMethod, request.uri, headers);
  }
}