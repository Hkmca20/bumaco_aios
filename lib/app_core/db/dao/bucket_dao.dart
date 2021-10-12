import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class BucketDao {
  @Query('SELECT * FROM bucketentity')
  Future<List<BucketEntity>> findAllBucketAndFavourites();

  @Query('SELECT * FROM bucketentity WHERE id = :id and isfavourite=true')
  Future<BucketEntity?> findFavouriteById(String id);

  @Query('SELECT * FROM bucketentity WHERE id = :id and isbucket=true')
  Future<BucketEntity?> findBucketById(String id);

  @Query('SELECT * FROM bucketentity WHERE isfavourite = true')
  Future<List<BucketEntity>> findAllFavouriteFromBucket();

  @Query('SELECT * FROM bucketentity WHERE isbucket = true')
  Future<List<BucketEntity>> findAllBucket();
  //---------------------------------------------------------
  @Query('UPDATE bucketentity SET quantity=:quantity WHERE ID=:id')
  Future<void> updateQuantityInBucket(int quantity, String id);

  @Query("DELETE FROM bucketentity WHERE id = :id")
  Future<void> deleteBucketById(String id);

  @insert
  Future<void> insertIntoBucket(BucketEntity product);

  @update
  Future<void> updateBucket(BucketEntity product);

  @delete
  Future<void> deleteBucket(BucketEntity product);
}
