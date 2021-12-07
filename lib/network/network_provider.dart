// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';

// import 'global.dart';

// enum Method { GET, POST, DELETE, PUT, HEAD, PATCH }

// const MethodValues = {
//   Method.GET: 'get',
//   Method.POST: 'post',
//   Method.DELETE: 'delete',
//   Method.PUT: 'put',
//   Method.HEAD: 'head',
//   Method.PATCH: 'patch'
// };

// typedef HttpSuccessCallback<T> = void Function(T data);
// typedef HttpFailureCallback = void Function(ErrorEntity data);
// final CancelToken _cancelToken = new CancelToken();

// _parseAndDecode(String response) {
//   return jsonDecode(response);
// }

// _parseJson(String text) {
//   return compute(_parseAndDecode, text);
// }

// class DioHelper {
//   Future request<T>(
//       {String baseUrl = '',
//       Method method = Method.GET,
//       String path = '',
//       Map<String, String>? headers,
//       Options? options,
//       String contentType = Headers.jsonContentType,
//       dynamic data, //Stream.fromIterable(data.map((e) => [e]))
//       Map<String, dynamic>? parameter,
//       @required HttpSuccessCallback<T>? success,
//       @required HttpFailureCallback? error}) async {
//     try {
//       final baseOptions = BaseOptions(
//           baseUrl: Uri.encodeFull(baseUrl),
//           contentType: contentType,
//           headers: headers,
//           //responseType: ResponseType.bytes,
//           receiveDataWhenStatusError: false,
//           connectTimeout: 60000,
//           receiveTimeout: 3000);

//       final dio = Dio(baseOptions)
//         ..interceptors.addAll(logInterceptor());

//       Options requestOptions = options ?? Options();
//       requestOptions.headers = requestOptions.headers ?? Map();

//       // GLOBAL OR COMMON AUTHORIZATION HEADER
//       Map<String, dynamic> authorization = getAuthorizationHeader();
//       if (authorization != null) {
//         requestOptions.headers.addAll(authorization);
//       }

//       // TODO COOKIE MANAGE
//       /*
//         CookieJar cookieJar = CookieJar();
//         dio.interceptors.add(CookieManager(cookieJar));
//       */

//       (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//           (client) {
//         client.badCertificateCallback =
//             (X509Certificate cert, String host, int port) {
//           return true;
//         };
//       };

//       (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
//       var response = await dio.request(path, data: data,
//           onSendProgress: (received, total) {
//         if (total != -1) {
//           print((received / total * 100).toStringAsFixed(0) + '%');
//         }
//       },
//           queryParameters: parameter,
//           options:
//               Options(method: MethodValues[method], headers: authorization),
//           cancelToken: _cancelToken);

//       if (success != null) {
//         success(response.data);
//       }

//       return response.data;
//     } on DioError catch (e) {
//       error(_getError(e));
//     }
//   }

//   // REQUEST CANCEL
//   cancelRequests(CancelToken token) {
//     token.cancel("cancelled");
//   }

//   // LOG DISPLAY
//   List<Interceptor> logInterceptor() {
//     return [LogInterceptor(requestBody: true, responseBody: true)];
//   }

//   /// AUTHORIZATION HEADER
//   Map<String, dynamic> getAuthorizationHeader() {
//     var headers;

//     if (Global.accessToken != null) {
//       headers = {'Authorization': 'Bearer ${Global.accessToken}'};
//     }
//     return headers;
//   }

//   ErrorEntity _getError(DioError error) {
//     switch (error.type) {
//       case DioErrorType.CANCEL:
//         {
//           return ErrorEntity(code: -1, message: 'dioRequestCancellation'.tr);
//         }
//         break;
//       case DioErrorType.CONNECT_TIMEOUT:
//         {
//           return ErrorEntity(code: -1, message: 'dioConnectionTimeOut'.tr);
//         }
//         break;
//       case DioErrorType.SEND_TIMEOUT:
//         {
//           return ErrorEntity(code: -1, message: 'dioRequestTimeOut'.tr);
//         }
//         break;
//       case DioErrorType.RECEIVE_TIMEOUT:
//         {
//           return ErrorEntity(code: -1, message: 'dioResponseTimeout'.tr);
//         }
//         break;
//       case DioErrorType.RESPONSE:
//         {
//           try {
//             int errCode = error.response.statusCode;
//             switch (errCode) {
//               case 400:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioRequestSyntaxError'.tr);
//                 break;
//               case 403:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioServerRefusedToExecute'.tr);
//                 break;
//               case 404:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioNotConnectServer'.tr);
//                 break;
//               case 405:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioRequestForbidden'.tr);
//                 break;
//               case 500:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioServerInternalError'.tr);
//                 break;
//               case 502:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioInvalidRequest'.tr);
//                 break;
//               case 503:
//                 return ErrorEntity(code: errCode, message: 'dioServerDown'.tr);
//                 break;
//               case 505:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioHttpNotSupport'.tr);
//                 break;
//               default:
//                 return ErrorEntity(
//                     code: errCode, message: 'dioUnknownMistake'.tr);
//             }
//           } on Exception catch (_) {
//             return ErrorEntity(code: -1, message: 'dioUnknownError'.tr);
//           }
//         }
//         break;
//       default:
//         return ErrorEntity(code: -1, message: error.message);
//     }
//   }
// }

// //GET THE ERROR FROM API
// class ErrorEntity {
//   final int code;
//   final String message;

//   ErrorEntity({this.code, this.message});
// }