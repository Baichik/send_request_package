import 'dart:convert';
import 'dart:io';

import 'package:request/src/request_type.dart';
import 'package:request/src/response_validaror.dart';

class DeleteData extends RequestType with RequestValidatorMixin {
  DeleteData({
    required super.url,
    super.headers,
    super.parameters,
    super.data,
    super.format,
  });

  @override
  void sendRequest() async {
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
    await request.close().then((response) => responseValidator(response));
  }
}
