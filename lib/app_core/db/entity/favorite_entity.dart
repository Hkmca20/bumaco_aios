import 'package:floor/floor.dart';
// Supported Types
// int - REAL
// double - REAL
// String - TEXT
// bool - REAL (0 = false, 1 = true)
// Uint8List - BLOB

// @transaction
// Future<void> replacePersons(List<Person> persons) async {
//   await deleteAllPersons();
//   await insertPersons(persons);
// }

// update entity with new 'nickname' field
// @Entity(tableName: 'favourite')

// @Entity(tableName: 'table_name', indices: [Index(value: ['custom_name'])])

// Add a list of ForeignKeys to the Entity annotation of the referencing entity.
// @Entity(
//   tableName: 'dog',
//   foreignKeys: [
//     ForeignKey(
//       childColumns: ['owner_id'],
//       parentColumns: ['id'],
//       entity: BucketEntity,
//     )
//   ],
// )
@entity
class FavouriteEntity {
  final String category;
  final String childcategory;
  final String subcategory;
  @primaryKey
  final String id;

  // Ignoring Fields--
  // @ignore
  // Set custom-nickname column name for a field--
  // @ColumnInfo(name: 'custom_name', nullable: false)
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
