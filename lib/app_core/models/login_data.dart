import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  const LoginData({
    required this.id,
    this.name = '',
    this.fname = '',
    this.lname = '',
    this.email = '',
    this.phone = '',
    this.address,
    this.streetNo,
    this.company,
    this.image,
    this.state,
    this.city,
    this.pincode,
    this.des,
    this.password,
    this.otp = '',
    required this.createDate,
    required this.modifiDate,
    this.status = '',
  });

  final String id;
  final String name;
  final dynamic fname;
  final dynamic lname;
  final String email;
  final String phone;
  final String? address;
  @JsonKey(name: 'street_no')
  final String? streetNo;
  final String? company;
  final String? image;
  final String? state;
  final String? city;
  final String? pincode;
  final String? des;
  final String? password;
  final String otp;
  @JsonKey(name: 'create_date')
  final DateTime createDate;
  @JsonKey(name: 'modifi_date')
  final DateTime modifiDate;
  final String status;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
