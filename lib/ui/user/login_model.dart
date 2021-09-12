// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
        required this.currUser,
    });

    int code;
    bool status;
    String message;
    String data;
    String currUser;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"],
        currUser: json["currUser"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data,
        "currUser": currUser,
    };
}
