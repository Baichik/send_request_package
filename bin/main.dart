import 'package:request/request.dart';
import 'package:request/src/method.dart';

void main() {
  Request(
    url: "https://my-json-server.typicode.com/typicode/demo/posts/1",
    method: Method.put,
    headers: {'content-type': 'application/json'},
    data: {'id': 1},
  ).sendRequest();
}
