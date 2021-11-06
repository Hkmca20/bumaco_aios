import 'package:get/get.dart';

class FilterController extends GetxController {
//filter view variables
  var selectedFilterIndex = 0.obs;
  var selectedCheckboxValue = ''.obs;
  var secondListChecked = false.obs;
  var filterCount = 0.obs;

  var newList = <String>[].obs;

  //sort by variables
  var selectedSortText = 'Popularity'.obs;
  var selectedSortRadio = 0.obs;

  // //static declarations
  // final leftList = [
  //   'Category',
  //   'Brand',
  //   'Price',
  //   'Discount',
  //   'Avg Customer Rating',
  //   'Hair Type',
  //   'Concern',
  //   'Gender',
  //   'Formulation',
  //   'Preference'
  // ];
  // final rightList = {
  //   0: <String>['Hair', 'Personal Care', 'Appliance', 'Men\'s Store'],
  //   1: <String>['Matrx', 'L\'Oreal Professional'],
  //   2: <String>['0 - 499', '500 - 999', '1000 - 1999', '2000 and above'],
  //   3: <String>['10% and above', 'All discounted products'],
  //   4: <String>[
  //     '4 stars and above',
  //     '3 stars and above',
  //     '2 stars and above',
  //     '1 stars and above'
  //   ],
  //   5: <String>[
  //     'Normal',
  //     'Dryness',
  //     'Straight',
  //     'Oily',
  //     'Fine',
  //     'Curly',
  //     'Dull Hair',
  //     'Thin',
  //     'Thick',
  //     'Wavy'
  //   ],
  //   6: <String>[
  //     'Normal',
  //     'Dryness',
  //     'Straight',
  //     'Oily',
  //     'Fine',
  //     'Curly',
  //     'Dull Hair',
  //     'Thin',
  //     'Thick',
  //     'Wavy'
  //   ],
  //   7: <String>['Unisex', 'Female'],
  //   8: <String>['Liquid', 'Mask', 'Cream', 'Serum', 'Foam', 'Oil', 'Sprey'],
  //   9: <String>['Organic', 'Natural', 'Harbal'],
  // };

  chageNewList(list) {
    newList.value = list;
  }
}
