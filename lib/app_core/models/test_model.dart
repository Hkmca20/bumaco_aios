import 'dart:convert';

import 'package:flutter/foundation.dart';

class TestModel {
  final int status;
  final String message;
  final List responseData;

  TestModel(
    this.status,
    this.message,
    this.responseData,
  );

  TestModel copyWith({
    int? status,
    String? message,
    List? responseData,
  }) {
    return TestModel(
      status ?? this.status,
      message ?? this.message,
      responseData ?? this.responseData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'responseData': responseData,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      map['status'],
      map['message'],
      List.from(map['responseData']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) => TestModel.fromMap(json.decode(source));

  @override
  String toString() => 'TestModel(status: $status, message: $message, responseData: $responseData)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TestModel &&
      other.status == status &&
      other.message == message &&
      listEquals(other.responseData, responseData);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ responseData.hashCode;
}
