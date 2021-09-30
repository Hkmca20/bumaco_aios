import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel();
  
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'fname')
  String? fname;

  @JsonKey(name: 'lname')
  String? lname;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'address2')
  String? address2;

  @JsonKey(name: 'displayname')
  String? displayname;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'city')
  String? city;

  @JsonKey(name: 'pincode')
  String? pincode;

  @JsonKey(name: 'dest')
  String? dest;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'create_date')
  String? createDate;

  @JsonKey(name: 'modifi_date')
  String? modifiDate;

  @JsonKey(name: 'status')
  String? status;


  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
