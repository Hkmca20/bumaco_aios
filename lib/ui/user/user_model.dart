// To parse this JSON data, do
//
//     final userModel = userModel.FromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.code,
        required this.status,
        required this.message,
        required this.dataSet,
    });

    int? code;
    bool? status;
    String? message;
    List<User> dataSet;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        dataSet: List<User>.from(json["data"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(dataSet.map((x) => x.toJson())),
    };
}

class User {
    User({
        required this.id,
        required this.userId,
        required this.userName,
        required this.picture,
        required this.userPhoto,
        required this.userOtp,
        required this.sex,
        required this.userType,
        required this.userRoll,
        required this.userMobile,
        required this.userMobileVerified,
        required this.email,
        required this.password,
        required this.userActive,
        required this.userRemark,
        required this.userRating,
        required this.streetAddress,
        required this.city,
        required this.state,
        required this.country,
        required this.locality,
        required this.userLat,
        required this.userLng,
        required this.postalCode,
        required this.shopName,
        required this.gstin,
        required this.createdBy,
        required this.updatedBy,
        required this.createdAt,
        required this.updatedAt,
    });

    int id=0;
    String userId;
    String userName;
    String picture;
    String userPhoto;
    String userOtp;
    String sex;
    int userType =0;
    String userRoll;
    String userMobile;
    int userMobileVerified;
    String email;
    String password;
    int userActive;
    String userRemark;
    String userRating;
    String streetAddress;
    String city;
    String state;
    String country;
    String locality;
    double userLat;
    double userLng;
    String postalCode;
    String shopName;
    String gstin;
    int createdBy;
    int updatedBy;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        picture: json["picture"],
        userPhoto: json["user_photo"],
        userOtp: json["user_otp"],
        sex: json["sex"],
        userType: json["user_type"],
        userRoll: json["user_roll"],
        userMobile: json["user_mobile"],
        userMobileVerified: json["user_mobile_verified"],
        email: json["email"],
        password: json["password"],
        userActive: json["user_active"],
        userRemark: json["user_remark"],
        userRating: json["user_rating"],
        streetAddress: json["street_address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        locality: json["locality"],
        userLat: json["user_lat"].toDouble(),
        userLng: json["user_lng"].toDouble(),
        postalCode: json["postal_code"],
        shopName: json["shop_name"],
        gstin: json["gstin"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "picture": picture,
        "user_photo": userPhoto,
        "user_otp": userOtp,
        "sex": sex,
        "user_type": userType,
        "user_roll": userRoll,
        "user_mobile": userMobile,
        "user_mobile_verified": userMobileVerified,
        "email": email,
        "password": password,
        "user_active": userActive,
        "user_remark": userRemark,
        "user_rating": userRating,
        "street_address": streetAddress,
        "city": city,
        "state": state,
        "country": country,
        "locality": locality,
        "user_lat": userLat,
        "user_lng": userLng,
        "postal_code": postalCode,
        "shop_name": shopName,
        "gstin": gstin,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
