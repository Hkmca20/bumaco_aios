import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    this.id ='',
    this.hasvery,
    this.category = '',
    this.url,
    this.image,
    this.bannerimage = 'https://icons8.com/preloaders/preloaders/1474/Walk.gif',//https://via.placeholder.com/350x150
    this.createdate,
    this.modifydate,
    this.status,
    this.color = kWhiteColor,
  });

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'has_very')
  String? hasvery;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'bannerimage')
  String bannerimage;

  @JsonKey(name: 'createdate')
  String? createdate;

  @JsonKey(name: 'modifydate')
  String? modifydate;

  @JsonKey(name: 'status')
  String? status;

  Color color;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  // List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(
  //     json.decode(str).map((x) => CategoryModel.fromJson(x)));

  // String categoryModelToJson(List<CategoryModel> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

}
