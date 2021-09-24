// import 'dart:convert';
// import 'dart:io';

// import 'package:bumaco_aios/app_utils/app_const.dart';
// import 'package:bumaco_aios/network/app_excep.dart';
// import 'package:bumaco_aios/ui/user/login_model.dart';
// import 'package:bumaco_aios/ui/user/user_add_model.dart';
// import 'package:bumaco_aios/ui/user/user_model.dart';
import 'dart:convert';

import 'package:bumaco_aios/ui/shopping/model/products.dart';
import 'package:http/http.dart' as http;

import 'network.dart';

class ApiManager {
  Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
    // 'Access-Control-Allow-Origin': '.htaccess',
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    // "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
    // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
    "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT"
  };
  static final client = http.Client();
  Future<List<Products>?> fetchProducts() async {
    String url =
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

    var response = await client.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var jsonMap = _returnResponse(response);
      return Products.fromJson(jsonMap)as List<Products>;
    }
    return null;
  }

//   Future<LoginModel> fetchLoginService(mobileNo, password) async {
//     String bodyString =
//         jsonEncode(<String, String>{'mobile': mobileNo, 'password': password});

//     late LoginModel? loginModel;
//     try {
//       final response = await client.post(Uri.parse(AppConstants.userLogin),
//           headers: header, body: bodyString);

//       var jsonMap = _returnResponse(response);
//       loginModel = LoginModel.fromJson(jsonMap);
//       switch (loginModel.code) {
//         case 200:
//           return loginModel;
//         default:
//           throw Exception(loginModel.message);
//       }
//     } on SocketException {
//       throw FetchDataException('No Internet connection!');
//     } catch (e) {
//       print(e);
//       throw FetchDataException("Something went wrong!");
//     }
//   }

//   Future<UserModel> fetchUserByIdService(columnName, fieldName) async {
//     String bodyString = jsonEncode(
//         <String, String>{'column_name': columnName, 'find_by': fieldName});

//     late UserModel? userModel;
//     try {
//       final response = await client.post(Uri.parse(AppConstants.userFind),
//           headers: header, body: bodyString);

//       var jsonMap = _returnResponse(response);
//       userModel = UserModel.fromJson(jsonMap);
//       switch (userModel.code) {
//         case 200:
//           return userModel;
//         default:
//           throw Exception(userModel.message);
//       }
//     } on SocketException {
//       throw FetchDataException('No Internet connection!');
//     } catch (e) {
//       print(e);
//       throw FetchDataException("Something went wrong!");
//     }
//   }

//   Future<UserAddModel> userInsertService(
//       userRoll,
//       userId,
//       userName,
//       mobileNo,
//       password,
//       email,
//       address,
//       city,
//       state,
//       postalCode,
//       shopName,
//       gstin) async {
//     String bodyString = jsonEncode(<String, String>{
//       'user_roll': userRoll,
//       'user_id': userId,
//       'user_name': userName,
//       'user_mobile': mobileNo,
//       'password': password,
//       'email': email,
//       'street_address': address,
//       'city': city,
//       'state': state,
//       'postal_code': postalCode,
//       'shop_name': shopName,
//       'gstin': gstin,
//       'picture': '',
//       'user_photo': '',
//       'sex': 'm',
//       'user_type': '0',
//       'user_remark': '',
//       'user_rating': '',
//       'locality': '',
//       'user_lat': '',
//       'user_lng': '',
//     });

//     late UserAddModel? userAddModel;
//     try {
//       final res = await client.post(Uri.parse(AppConstants.userAdd),
//           headers: header, body: bodyString);

//       var jsonMap = _returnResponse(res);
//       userAddModel = UserAddModel.fromJson(jsonMap);
//       switch (userAddModel.code) {
//         case 200:
//           return userAddModel;
//         default:
//           throw (userAddModel.message);
//       }
//     } on SocketException {
//       throw FetchDataException('No Internet connection!');
//     } catch (e) {
//       print(e);
//       throw FetchDataException("Something went wrong!");
//     }
//   }

//   Future<UserModel> getUserList() async {
//     late UserModel? userModel;
//     try {
//       final response = await client.get(Uri.parse(AppConstants.userList));
//       var jsonMap = _returnResponse(response);
//       userModel = UserModel.fromJson(jsonMap);
//       return userModel;
//     } on SocketException {
//       return UserModel(
//           code: 400,
//           message: 'Internal Server Error',
//           status: false,
//           dataSet: []);
//       // throw FetchDataException('No Internet connection!');
//     } catch (e) {
//       print("Err: " + e.toString());
//       return UserModel(
//           code: 400,
//           message: 'Internal Server Error',
//           status: false,
//           dataSet: []);
//           // return Future.error("This is the error", StackTrace.fromString("This is its trace"));
//       // throw FetchDataException("Something went wrong!");
//     }
//   }

//   fetchUserUpdateService(String s, id) async {
//     String bodyString = jsonEncode(<String, String>{
//       // 'user_roll': userRoll,
//       // 'user_id': userId,
//       // 'user_name': userName,
//       // 'user_mobile': mobileNo,
//       // 'password': password,
//       // 'email': email,
//       // 'street_address': address,
//       // 'city': city,
//       // 'state': state,
//       // 'postal_code': postalCode,
//       // 'shop_name': shopName,
//       // 'gstin': gstin,
//       'picture': '',
//       'user_photo': '',
//       'sex': 'm',
//       'user_type': '0',
//       'user_remark': '',
//       'user_rating': '',
//       'locality': '',
//       'user_lat': '',
//       'user_lng': '',
//     });

//     late UserAddModel? userAddModel;
//     try {
//       final response = await client.post(Uri.parse(AppConstants.userUpdate),
//           headers: header, body: bodyString);

//       var jsonMap = _returnResponse(response);
//       userAddModel = UserAddModel.fromJson(jsonMap);
//       switch (userAddModel.code) {
//         case 200:
//           return userAddModel;
//         default:
//           throw (userAddModel.message);
//       }
//     } on SocketException {
//       throw FetchDataException('No Internet Connection!');
//     } catch (e) {
//       print(e);
//       throw FetchDataException("Something went wrong!");
//     }
//   }

  dynamic _returnResponse(http.Response response) {
    print('status code = ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response);
      case 404:
        throw FetchDataException("Sever Down!");
      case 500:
        throw FetchDataException("Internal Server Error!");
      default:
        throw FetchDataException(
            'Something went wrong : ${response.statusCode}');
    }
  }
}
