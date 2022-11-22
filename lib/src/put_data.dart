import 'dart:convert';
import 'dart:io';

class PutData {
  final String url;
  final String? method;
  final Map<String, String>? parameters;
  final Map<String, String>? headers;
  final Map<String, dynamic>? data;
  final String? format;

  PutData({
    required this.url,
    this.method,
    this.parameters,
    this.headers,
    this.data,
    this.format,
  });

  void putRequest() async {
    HttpClient client = HttpClient();
    final uri = Uri.parse(url).replace(queryParameters: parameters);

    String jsonString = json.encode(data);
    List<int> bodyBytes = utf8.encode(jsonString);
    HttpClientRequest request = await client.putUrl(uri);

    if (headers != null) {
      String key = '';
      String value = '';
      for (String i in headers!.keys) {
        key = i;
      }
      for (String val in headers!.values) {
        value = val;
      }
      request.headers.add(key, value);
    }
    if (format != null) {
      request.headers.add("content-type", format!);
    }
    request.add(bodyBytes);
    await request.close().then((response) {
      switch (response.statusCode) {
        case 200:
          {
            print("\x1B[32mВсе прошло удачно");
          }
          break;
        case 400:
          {
            print("\x1B[31mДанные не верны");
          }
          break;
        case 500:
          {
            print("\x1B[31mПроизошла неизвестная ошибка");
          }
          break;
        case 403:
          {
            print("\x1B[31mУ Вас нету доступа на данный сервис");
          }
          break;
        default:
          {
            print("\x1B[31mЧто-то пошло не так");
          }
      }
    });
  }
}
