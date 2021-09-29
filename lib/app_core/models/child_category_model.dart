import 'package:json_annotation/json_annotation.dart';

part 'child_category_model.g.dart';

@JsonSerializable()
class ChildCategoryModel {
  ChildCategoryModel();

  @JsonKey(name: 'childcategory')
  String? childcategory;

  @JsonKey(name: 'category')
  String? category;

  @JsonKey(name: 'subcategory')
  String? subcategory;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'description')
  String? description;

  factory ChildCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ChildCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChildCategoryModelToJson(this);
}
