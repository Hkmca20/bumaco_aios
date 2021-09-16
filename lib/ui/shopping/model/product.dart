import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class Product extends Equatable {
  late final int id;
  final String produntCategory;
  final String produntName;
  final String produntImage;
  final String produntDescription;
  final double produntPrice;
  final bool isPopular;
  final bool isNew;
  final bool isRecommended;

  Product({
    required this.id,
    required this.produntCategory,
    required this.produntName,
    required this.produntImage,
    required this.produntDescription,
    required this.produntPrice,
    required this.isPopular,
    required this.isNew,
    required this.isRecommended,
  });
  final isFavorite = false.obs;
  final quantity = 1.obs;

  @override
  List<Object?> get props => [
        id,
        produntCategory,
        produntName,
        produntImage,
        produntDescription,
        produntPrice,
        isPopular,
        isNew,
        isRecommended
      ];
      static final productList = <Product>[
      Product(
        id: 1,
        produntName: 'First Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',

        produntDescription: 'ProduntDescription 1',
        produntPrice: 30.5,
        // isFavorite: false,
        produntCategory: 'Name 1',
        isNew: false,
        isPopular: true,
        isRecommended: false
      ),
      Product(
        id: 2,
        produntName: 'Second Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',

        produntDescription: 'ProduntDescription 2',
        produntPrice: 40.5,
        // isFavorite: true,
        produntCategory: 'Name 1',
        isNew: false,
        isPopular: true,
        isRecommended: false,
      ),
      Product(
        id: 3,
        produntName: 'Third Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',

        produntDescription: 'ProduntDescription 3',
        produntPrice: 50.2,
        // isFavorite: false,
        produntCategory: 'Name 1',
        isNew: true,
        isPopular: false,
        isRecommended: false,
      ),
      Product(
        id: 4,
        produntName: 'Fourth Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',

        produntDescription: 'ProduntDescription 4',
        produntPrice: 60.1,
        // isFavorite: true,
        produntCategory: 'Name 2',
        isNew: false,
        isPopular: false,
        isRecommended: true,
      ),
      Product(
        id: 5,
        produntName: 'Fifth Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',

        produntDescription: 'ProduntDescription 5',
        produntPrice: 70.7,
        // isFavorite: false,
        produntCategory: 'Name 2',
        isNew: true,
        isPopular: false,
        isRecommended: false,
      ),
      Product(
        id: 6,
        produntName: 'Sixth Product',
        produntImage:
            'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',

        produntDescription: 'ProduntDescription 6',
        produntPrice: 80.8,
        // isFavorite: false,
        produntCategory: 'Name 13',
        isNew: false,
        isPopular: false,
        isRecommended: true
      ),
      Product(
        id: 7,
        produntName: 'Seventh Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',

        produntDescription: 'ProduntDescription 7',
        produntPrice: 90.9,
        // isFavorite: false,
        produntCategory: 'Name 14',
        isNew: false,
        isPopular: true,
        isRecommended: false,
      ),
      Product(
        id: 8,
        produntName: 'Eighth Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',

        produntDescription: 'ProduntDescription 8',
        produntPrice: 100.1,
        // isFavorite: true,
        produntCategory: 'Name 1',
        isNew: false,
        isPopular: false,
        isRecommended: true,
      ),
      Product(
        id: 9,
        produntName: 'Ninth Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',

        produntDescription: 'ProduntDescription 9',
        produntPrice: 100.2,
        // isFavorite: true,
        produntCategory: 'Name 1',
        isNew: false,
        isPopular: true,
        isRecommended: false,
      ),
      Product(
        id: 10,
        produntName: 'Tenth Product',
        produntImage:
            'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
        // 'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',

        produntDescription: 'ProduntDescription 10',
        produntPrice: 100.3,
        // isFavorite: false,
        produntCategory: 'Name 1',
        isNew: false,
        isPopular: true,
        isRecommended: false,
      ),
    ];
}
