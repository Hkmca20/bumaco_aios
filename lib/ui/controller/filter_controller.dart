import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class FilterItem {
  final id;
  var fRadioSelect = ''.obs;
  bool fSelect;
  List<FSubItem> list = [];
  var itemCount = 0.obs;
  var itemType = 1;
  final String name;
  FilterItem({
    this.id = '',
    this.name = '',
    required this.fRadioSelect,
    this.fSelect = false,
    this.itemType = 1,
    required this.itemCount,
    required this.list,
  });
}

class FSubItem {
  final id;
  var selected = false.obs;
  final int itemType;
  final String name;
  FSubItem({
    this.id = '',
    this.name = '',
    required this.selected,
    this.itemType = 1,
  });
}

class FilterController extends GetxController {
  static FilterController get to => Get.find(tag: FILTER_CONTROLLER);

  var filterText = '';
  var selectedFilter = <String>[];

  //filter view variables
  late List<FilterItem> filterList = <FilterItem>[].obs;
  var selectedFilterIndex = 0.obs;

  //sort by variables
  var selectedSortText = 'Popularity'.obs;
  var selectedSortRadio = 0.obs;

  @override
  onInit() {
    setFilterData();
    super.onInit();
  }

  setFilterData() {
    filterList = [
      FilterItem(
        id: "1",
        name: "Category",
        fRadioSelect: ''.obs,
        fSelect: false,
        itemCount: 0.obs,
        itemType: 1,
        list: [
          FSubItem(
            id: '11',
            name: 'Hair',
            selected: false.obs,
          ),
          FSubItem(
            id: '11',
            name: 'Personal Care',
            selected: false.obs,
          ),
          FSubItem(
            id: '11',
            name: 'Appliance',
            selected: false.obs,
          ),
          FSubItem(
            id: '11',
            name: 'Men\'s Store',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "2",
        name: "Brand",
        fRadioSelect: ''.obs,
        fSelect: false,
        itemCount: 0.obs,
        itemType: 1,
        list: [
          FSubItem(
            id: '22',
            name: 'Matrx',
            selected: false.obs,
          ),
          FSubItem(
            id: '22',
            name: 'L\'Oreal Professional',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "3",
        name: "Price",
        fRadioSelect: ''.obs,
        fSelect: false,
        itemCount: 0.obs,
        itemType: 2,
        list: [
          FSubItem(
            id: '33',
            name: '0 - 499',
            selected: false.obs,
          ),
          FSubItem(
            id: '33',
            name: '500 - 999',
            selected: false.obs,
          ),
          FSubItem(
            id: '33',
            name: '1000 - 1999',
            selected: false.obs,
          ),
          FSubItem(
            id: '33',
            name: '2000 and above',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "4",
        name: "Discount",
        fRadioSelect: ''.obs,
        fSelect: false,
        itemCount: 0.obs,
        itemType: 2,
        list: [
          FSubItem(
            id: '44',
            name: '10% and above',
            selected: false.obs,
          ),
          FSubItem(
            id: '44',
            name: 'All discounted products',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "5",
        name: "Avg Customer Rating",
        fRadioSelect: ''.obs,
        fSelect: false,
        itemCount: 0.obs,
        itemType: 2,
        list: [
          FSubItem(
            id: '55',
            name: '4 stars and above',
            selected: false.obs,
          ),
          FSubItem(
            id: '55',
            name: '3 stars and above',
            selected: false.obs,
          ),
          FSubItem(
            id: '55',
            name: '2 stars and above',
            selected: false.obs,
          ),
          FSubItem(
            id: '55',
            name: '1 stars and above',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "6",
        name: "Hair Type",
        fRadioSelect: ''.obs,
        fSelect: false,
        itemCount: 0.obs,
        itemType: 1,
        list: [
          FSubItem(
            id: '66',
            name: 'Normal',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Dryness',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Straight',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Oily',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Fine',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Curly',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Dull Hair',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Thin',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Thick',
            selected: false.obs,
          ),
          FSubItem(
            id: '66',
            name: 'Wavy',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "8",
        name: "Gender",
        fRadioSelect: ''.obs,
        itemCount: 0.obs,
        fSelect: false,
        itemType: 1,
        list: [
          FSubItem(
            id: "88",
            name: 'Unisex',
            selected: false.obs,
          ),
          FSubItem(
            id: "88",
            name: 'Female',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "9",
        name: "Formulation",
        fRadioSelect: ''.obs,
        fSelect: false,
        itemCount: 0.obs,
        list: [
          FSubItem(
            id: "99",
            name: 'Liquid',
            selected: false.obs,
          ),
          FSubItem(
            id: "99",
            name: 'Mask',
            selected: false.obs,
          ),
          FSubItem(
            id: "99",
            name: 'Cream',
            selected: false.obs,
          ),
          FSubItem(
            id: "99",
            name: 'Serum',
            selected: false.obs,
          ),
          FSubItem(
            id: "99",
            name: 'Foam',
            selected: false.obs,
          ),
          FSubItem(
            id: "99",
            name: 'Oil',
            selected: false.obs,
          ),
          FSubItem(
            id: "99",
            name: 'Sprey',
            selected: false.obs,
          ),
        ],
      ),
      FilterItem(
        id: "10",
        name: "Preference",
        fSelect: false,
        fRadioSelect: ''.obs,
        itemCount: 0.obs,
        list: [
          FSubItem(
            id: "100",
            name: 'Organic',
            selected: false.obs,
          ),
          FSubItem(
            id: "100",
            name: 'Natural',
            selected: false.obs,
          ),
          FSubItem(
            id: "100",
            name: 'Harbal',
            selected: false.obs,
          ),
        ],
      ),
    ].obs;
  }
}
