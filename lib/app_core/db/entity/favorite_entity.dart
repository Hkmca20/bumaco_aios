import 'package:floor/floor.dart';

@entity
class FavouriteEntity {
  final String category;
  final String childcategory;
  final String subcategory;
  @primaryKey
  final String id;

  final String hasvery;
  final String product;
  final String brand;
  final String productUrl;
  final String mrp;
  final String createdate;
  final String fimage;
  final String shortDescription;
  final String description;

  FavouriteEntity({
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
  @override
  String toString() => super.toString();
}
