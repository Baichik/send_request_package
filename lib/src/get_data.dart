import 'dart:convert';
import 'dart:io';

class GetData {
  final String url;
  final String? method;
  final Map<String, String>? parameters;
  final Map<String, String>? headers;
  final String? format;

  GetData({
    required this.url,
    this.method,
    this.parameters,
    this.headers,
    this.format,
  });

  void getRequest() async {
    HttpClient client = HttpClient();
    final uri = Uri.parse(url).replace(queryParameters: parameters);
    try {
      final response =
          await client.getUrl(uri).then((HttpClientRequest request) {
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
        return request.close();
      });

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
    } on SocketException {
      print("\x1B[31mНет интернет соеденения или не правильный адрес ссылки!");
    }
  }
}
