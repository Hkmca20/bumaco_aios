import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:get/get.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  BannerModel({
    this.id = '',
    this.hasvery,
    this.category = '',
    this.subcategory = '',
    this.childcategory = '',
    this.bannerposition = '',
    this.bannerlink = '',
    this.bannertext = '',
    this.image = '',
    this.bannerimage = '',
    this.createdate,
    this.modifydate,
    this.status,
    this.color = kPrimaryColor,
  });

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'has_very')
  String? hasvery;

  @JsonKey(name: 'category')
  String category;
  @JsonKey(name: 'subcategory')
  String subcategory;
  @JsonKey(name: 'childcategory')
  String childcategory;

  @JsonKey(name: 'banner_position')
  String bannerposition;
  @JsonKey(name: 'banner_link')
  String bannerlink;
  @JsonKey(name: 'banner_text')
  String bannertext;

  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'bannerimage')
  String bannerimage;

  @JsonKey(name: 'createdate')
  String? createdate;

  @JsonKey(name: 'modifydate')
  String? modifydate;

  @JsonKey(name: 'status')
  String? status;

  Color color;

  RxBool selected = false.obs;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
