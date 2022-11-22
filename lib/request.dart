import 'package:request/src/delete_data.dart';
import 'package:request/src/get_data.dart';
import 'package:request/src/post_data.dart';
import 'package:request/src/put_data.dart';

void sendRequest({
  required String url,
  String? method,
  Map<String, String>? parameters,
  Map<String, String>? headers,
  Map<String, dynamic>? data,
  String? format,
}) {
  switch (method) {
    case "get":
      {
        GetData get = GetData(
          url: url,
          method: method,
          parameters: parameters,
          headers: headers,
          format: format,
        );
        get.getRequest();
      }
      break;
    case "post":
      {
        PostData post = PostData(
          url: url,
          parameters: parameters,
          headers: headers,
          data: data,
          format: format,
        );
        post.postRequest();
      }
      break;
    case "put":
      {
        PutData post = PutData(
          url: url,
          parameters: parameters,
          headers: headers,
          data: data,
          format: format,
        );
        post.putRequest();
      }
      break;
    case "delete":
      {
        DeleteData post = DeleteData(
          url: url,
          parameters: parameters,
          headers: headers,
          data: data,
          format: format,
        );
        post.deleteRequest();
      }
      break;
    default:
      print("\x1B[31mНе верный метод!");
  }
}
