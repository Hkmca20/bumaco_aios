import 'package:json_annotation/json_annotation.dart';
import 'category_data.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  const CategoryModel({
    this.status = false,
    this.data = const [],
  });

  final bool status;
  final List<CategoryData> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  // List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(
  //     json.decode(str).map((x) => CategoryModel.fromJson(x)));

  // String categoryModelToJson(List<CategoryModel> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

}
