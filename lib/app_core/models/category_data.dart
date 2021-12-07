import 'package:json_annotation/json_annotation.dart';

part 'category_data.g.dart';

@JsonSerializable()
class CategoryData {
  CategoryData({
    this.category = '',
    required this.id,
    this.subcategory = '',
    this.image = '',
    this.url = '',
    this.description = '',
    this.bannerimage = '',
    this.childcategory = '',
  });

  final String category;
  final String id;
  final String subcategory;
  final String image;
  final String url;
  final String description;
  final String? bannerimage;
  final String childcategory;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
