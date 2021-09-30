// import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel(
      {this.id,
      this.hasvery,
      this.category,
      this.url,
      this.image,
      this.bannerimage,
      this.createdate,
      this.modifydate,
      this.status});

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'has_very')
  String? hasvery;

  @JsonKey(name: 'category')
  String? category;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'bannerimage')
  String? bannerimage;

  @JsonKey(name: 'createdate')
  String? createdate;

  @JsonKey(name: 'modifydate')
  String? modifydate;

  @JsonKey(name: 'status')
  String? status;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  // List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(
  //     json.decode(str).map((x) => CategoryModel.fromJson(x)));

  // String categoryModelToJson(List<CategoryModel> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  
}
