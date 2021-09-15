import 'package:bumaco_aios/ui/model/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'usermodel.g.dart';

@JsonSerializable()
class UserModel {
  static const ID = 'id';
  static const MOBILE = 'mobile';
  static const CART = 'cart';

  String? id;
  String? mobile;
  List<CartItemModel>? cart;
  UserModel({this.id, this.mobile, this.cart});

  
  UserModel.fromJson(Map<String, dynamic> json)
      : id= json['id'],mobile = json['mobile'],
        cart = json['cart'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'mobile':mobile,
        'cart': cart,
      };
}
