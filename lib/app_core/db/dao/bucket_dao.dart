import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:floor/floor.dart';

@dao
abstract class BucketDao {
  @Query('SELECT * FROM bucket_tbl')
  Future<List<ProductModel>> findAllBucket();

  @Query('SELECT * FROM bucket_tbl WHERE id = :id')
  Future<ProductModel?> findFavouriteById(String id);

  @insert
  Future<void> insertIntoBucket(ProductModel product);

  @update
  Future<void> updateBucket(ProductModel product);

  @delete
  Future<void> deleteBucket(ProductModel product);
}
