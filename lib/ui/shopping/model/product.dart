import 'package:get/get.dart';

class Product {
  late final int id;
  final String produntName;
  final String produntImage;
  final String produntDescription;
  final double produntPrice;

  Product({
    required this.id,
    required this.produntName,
    required this.produntImage,
    required this.produntDescription,
    required this.produntPrice,
  });
  final isFavorite = false.obs;
  final quantity = 1.obs;
}
