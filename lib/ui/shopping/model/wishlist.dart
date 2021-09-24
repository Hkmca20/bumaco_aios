import 'package:bumaco_aios/ui/shopping/model/models.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  final List<Product> products;
  const Wishlist({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}
