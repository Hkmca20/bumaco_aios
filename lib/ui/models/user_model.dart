import 'package:bumaco_aios/ui/models/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  static const ID = 'id';
  static const MOBILE = 'mobile';
  static const CART = 'cart';

  String? id;
  String? mobile;
  List<CartItemModel>? cart;
  UserModel({this.id, this.mobile, this.cart});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}