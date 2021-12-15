import 'dart:convert';
import 'dart:io';
import 'package:bumaco_aios/app_config/app_environment.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/network/dio_interceptor.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:dio/dio.dart';

enum Method { POST, GET, PUT, DELETE, HEAD, PATCH }

class DioClientImpl extends DioClient {
  late Dio _dio;

  @override
  Future<DioClient> init() async {
    _dio = Dio(
      BaseOptions(
        contentType: Headers.formUrlEncodedContentType,
        baseUrl: ApiConstants.baseUrlApi,
        headers: header,
        connectTimeout: 50000,
        receiveTimeout: 30000,
      ),
    )..interceptors.add(DioLogging());
    return this;
  }

  // final basicAuth = base64Encode('admin:admin'
  //     .codeUnits); //'Basic ${base64Encode(utf8.encode('admin:admin'))}'

  Map<String, String> header = {
    // HttpHeaders.contentTypeHeader: 'application/form-data;charset=UTF-8',
    // HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    HttpHeaders.acceptLanguageHeader: 'en',
    HttpHeaders.authorizationHeader:
        'Basic ${base64Encode(utf8.encode('${AppEnvironment.username}:${AppEnvironment.password}'))}',
    // HttpHeaders.authorizationHeader: 'Bearer ${AppEnvironment.apiKey}'
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials":
        'true', // Required for cookies, authorization headers with HTTPS
    // "Access-Control-Allow-Headers":
    //     "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
    "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT",
  };

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      if (e.response != null) {
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        print(e.message);
        throw Exception(e.message);
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        throw Exception(e.message);
      }
    }
    return response;
  }

// FormData formData = FormData.fromMap({
// 'phone': '9760909895', 'password': '123456'
// "image-param-name": await MultipartFile.fromFile(
//   imageFile.path,
//   filename: fileName,
//   contentType: new MediaType("image", "jpeg"), //add this
//   ),
// });
  @override
  Future request(
      String url, Method method, Map<String, dynamic>? params) async {
    Response response;
    try {
      if (method == Method.POST) {
        response = await _dio
            .post(url, onSendProgress: (received, total) {
              if (total != -1) {
                print((received / total * 100).toStringAsFixed(0) + '%');
              }
            }, data: params)
            .whenComplete(
              () => print("----->complete:"),
            )
            .catchError((onError) {
              print('--------->error:${onError.toString()}');
            });
      } else if (method == Method.PUT) {
        response = await _dio
            .put(url, data: params)
            .whenComplete(
              () => print("-----PUT>complete:"),
            )
            .catchError((onError) {
          print('---------PUT>error:${onError.toString()}');
        });
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.HEAD) {
        response = await _dio.head(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception("Bad Request!");
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 403) {
        throw Exception("Forbidden");
      } else if (response.statusCode == 406) {
        throw Exception("Dio Error");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
      // } on SocketException catch (e) {
      //   throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }
}
