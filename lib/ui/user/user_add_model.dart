// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

UserAddModel responseModelFromJson(String str) => UserAddModel.fromJson(json.decode(str));

String responseModelToJson(UserAddModel data) => json.encode(data.toJson());

class UserAddModel {
    UserAddModel({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
    });

    int code;
    bool status;
    String message;
    Data data;

    factory UserAddModel.fromJson(Map<String, dynamic> json) => UserAddModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.fieldCount,
        required this.affectedRows,
        required this.insertId,
        required this.serverStatus,
        required this.warningCount,
        required this.message,
        required this.protocol41,
        required this.changedRows,
    });

    int fieldCount;
    int affectedRows;
    int insertId;
    int serverStatus;
    int warningCount;
    String message;
    bool protocol41;
    int changedRows;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fieldCount: json["fieldCount"],
        affectedRows: json["affectedRows"],
        insertId: json["insertId"],
        serverStatus: json["serverStatus"],
        warningCount: json["warningCount"],
        message: json["message"],
        protocol41: json["protocol41"],
        changedRows: json["changedRows"],
    );

    Map<String, dynamic> toJson() => {
        "fieldCount": fieldCount,
        "affectedRows": affectedRows,
        "insertId": insertId,
        "serverStatus": serverStatus,
        "warningCount": warningCount,
        "message": message,
        "protocol41": protocol41,
        "changedRows": changedRows,
    };
}
