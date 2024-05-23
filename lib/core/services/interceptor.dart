import 'package:dio/dio.dart';

class ClientInterceptor implements Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('STATUS CODE [${response.statusCode}] => PATH: ${response.requestOptions.path} => RESPONSE: ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // print('REQUEST[${options.method}] => PATH: ${options.path}');
    return handler.next(options);
  }
}
