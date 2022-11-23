import 'package:request/src/delete_data.dart';
import 'package:request/src/get_data.dart';
import 'package:request/src/method.dart';
import 'package:request/src/post_data.dart';
import 'package:request/src/put_data.dart';
import 'package:request/src/request_type.dart';

class Request extends RequestType {
  final Method method;
  Request({
    required super.url,
    required this.method,
    super.headers,
    super.parameters,
    super.data,
    super.format,
  });

  @override
  void sendRequest() {
    switch (method) {
      case Method.get:
        {
          GetData get = GetData(
            url: url,
            parameters: parameters,
            headers: headers,
            format: format,
          );
          get.sendRequest();
        }
        break;
      case Method.post:
        {
          PostData post = PostData(
            url: url,
            parameters: parameters,
            headers: headers,
            data: data,
            format: format,
          );
          post.sendRequest();
        }
        break;
      case Method.put:
        {
          PutData post = PutData(
            url: url,
            parameters: parameters,
            headers: headers,
            data: data,
            format: format,
          );
          post.sendRequest();
        }
        break;
      case Method.delete:
        {
          DeleteData post = DeleteData(
            url: url,
            parameters: parameters,
            headers: headers,
            data: data,
            format: format,
          );
          post.sendRequest();
        }
        break;
      default:
        print("\x1B[31mНе верный метод!");
    }
  }
}
