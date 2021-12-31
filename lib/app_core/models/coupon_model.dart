import 'package:json_annotation/json_annotation.dart';

part 'coupon_model.g.dart';

@JsonSerializable()
class CouponModel {
  CouponModel();

  @JsonKey(name: 'id')
  String id = '';

  @JsonKey(name: 'has_very')
  String? hasvery;

  @JsonKey(name: 'childcategory')
  String? childcategory;

  @JsonKey(name: 'coupon_code')
  String? couponcode;

  @JsonKey(name: 'coupon_type')
  String? coupontype;

  @JsonKey(name: 'coupon_value')
  String? couponvalue;

  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'start_date')
  String? startdate;

  @JsonKey(name: 'end_date')
  String? enddate;

  @JsonKey(name: 'status')
  String? status;

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
  Map<String, dynamic> toJson() => _$CouponModelToJson(this);
}
