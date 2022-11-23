import 'dart:io';

import 'package:request/src/request_type.dart';
import 'package:request/src/response_validaror.dart';

class GetData extends RequestType with RequestValidatorMixin {
  GetData({
    required super.url,
    super.parameters,
    super.headers,
    super.format,
  });

  @override
  void sendRequest() async {
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

      responseValidator(response);
    } on SocketException {
      print("\x1B[31mНет интернет соеденения или не правильный адрес ссылки!");
    }
  }
}
