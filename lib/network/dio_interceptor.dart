import 'package:dio/dio.dart';

class DioLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}'
        '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode},${response.statusMessage}] => PATH: ${response.requestOptions.path}'
      '\n=> HEADERS: ${response.headers}\n=> DATA: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode},${err.response?.statusMessage}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
