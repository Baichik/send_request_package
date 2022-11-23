import 'dart:io';

mixin RequestValidatorMixin {
  void responseValidator(HttpClientResponse response) {
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
  }
}
