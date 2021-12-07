import 'package:json_annotation/json_annotation.dart';
import 'login_data.dart';

part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel {
  const LoginModel({
    required this.status,
    required this.message,
    required this.loginData,
  });

  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final LoginData loginData;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  String toString() {
    return super.toString();
  }
}
