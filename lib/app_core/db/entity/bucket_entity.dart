import 'package:floor/floor.dart';

@entity
class BucketEntity {
  // @PrimaryKey(autoGenerate: true)
  // final String uid;

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
  int quantity;
  final bool isFavourite;
  final bool isBucket;

  BucketEntity({
    // this.uid = '',
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
    this.quantity = 0,
    this.isFavourite = false,
    this.isBucket = false,
  });
    double totalPrice = 0.0;
}
