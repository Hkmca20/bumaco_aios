import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    this.category = '',
    this.childcategory = '',
    this.subcategory = '',
    this.id = '',
    this.hasvery = '',
    this.product = '',
    this.brand = '',
    this.productUrl = '',
    this.mrp = '',
    this.createdate = '',
    this.fimage = '',
    this.shortDescription = '',
    this.description = '',
  });

  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'childcategory')
  final String childcategory;
  @JsonKey(name: 'subcategory')
  final String subcategory;
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'has_very')
  final String hasvery;
  @JsonKey(name: 'product')
  final String product;
  @JsonKey(name: 'brand')
  final String brand;
  @JsonKey(name: 'product_url')
  final String productUrl;
  @JsonKey(name: 'mrp')
  final String mrp;
  @JsonKey(name: 'createdate')
  final String createdate;
  @JsonKey(name: 'fimage')
  final String fimage;
  @JsonKey(name: 'short_description')
  final String shortDescription;
  @JsonKey(name: 'description')
  final String description;

  // var quantity=0.obs;
  @JsonKey(ignore: true)
  var isFavorite = false.obs;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
