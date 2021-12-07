import 'package:json_annotation/json_annotation.dart';

part 'sub_category_model.g.dart';

@JsonSerializable()
class SubCategoryModel {
  SubCategoryModel();

  @JsonKey(name: 'category')
  String? category;

  @JsonKey(name: 'subcategory')
  String? subcategory;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'bannerimage')
  String? bannerimage;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(ignore: true)
  String id = '';

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
