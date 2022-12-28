import 'package:dio/dio.dart';

class DioService {
  static Future<Response> getData() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    final Response response = await Dio().get(url);

    return response;
  }
}