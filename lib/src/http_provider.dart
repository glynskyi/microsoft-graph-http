import 'package:http/http.dart' as http;
import 'package:microsoft_graph/microsoft_graph.dart';

class HttpProvider implements IHttpProvider {

  @override
  Future<HttpResponseMessage> send(HttpRequestMessage request) async {
    final Map<String, String> requestHeaders = Map.fromIterable(request.headers,
        key: (h) => h.name, value: (h) => h.value);
    final response =
        await http.get(request.uri.toString(), headers: requestHeaders);
    final responseHeaders = response.headers.entries
        .map((entry) => HttpHeader(entry.key, entry.value))
        .toList();
    return HttpResponseMessage(
        response.statusCode, responseHeaders, response.body);
  }
}
