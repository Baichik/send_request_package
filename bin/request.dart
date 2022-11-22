import 'package:request/request.dart' as request;

void main() {
  request.sendRequest(
    url: "https://my-json-server.typicode.com/typicode/demo/posts/1",
    method: "delete",
    headers: {'content-type': 'application/json'},
    data: {'id': 1},
  );
}
