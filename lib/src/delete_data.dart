import 'dart:convert';
import 'dart:io';

class DeleteData {
  final String url;
  final Map<String, String>? headers;
  final Map<String, String>? parameters;
  final Map<String, dynamic>? data;
  final String? format;

  DeleteData({
    required this.url,
    this.headers,
    this.parameters,
    this.data,
    this.format,
  });

  void deleteRequest() async {
    HttpClient client = HttpClient();
    final uri = Uri.parse(url);

    String jsonString = json.encode(data);
    List<int> bodyBytes = utf8.encode(jsonString);
    var request = await client.deleteUrl(uri);

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
