abstract class RequestType {
  final String url;
  final Map<String, String>? headers;
  final Map<String, String>? parameters;
  final Map<String, dynamic>? data;
  final String? format;

  RequestType({
    required this.url,
    this.headers,
    this.parameters,
    this.data,
    this.format,
  });

  void sendRequest();
}
