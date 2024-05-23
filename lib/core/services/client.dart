import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nexus_app/core/index.dart';

class Client {
  Client() {
    addInterceptor(ClientInterceptor());
  }

  final Dio dio = Dio(BaseOptions(
      connectTimeout: Duration(milliseconds: 10000),
      receiveTimeout: Duration(milliseconds: 10000),
      baseUrl: dotenv.get('API_URL') + dotenv.get('API_VERSION')));

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }
}
