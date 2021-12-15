import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class BucketDao {
  @Query('SELECT * FROM bucketentity')
  Future<List<BucketEntity>> findAllBucketAndFavourites();

  @Query('SELECT * FROM bucketentity WHERE id=:id and isfavourite=1')
  Future<BucketEntity?> findFavouriteById(String id);

  @Query('SELECT * FROM bucketentity WHERE id=:id and isbucket=1')
  Future<BucketEntity?> findBucketById(String id);

  @Query('SELECT * FROM bucketentity WHERE isfavourite=1')
  Future<List<BucketEntity>> findAllFavouriteFromBucket();

  @Query('SELECT * FROM bucketentity WHERE isbucket=1')
  Future<List<BucketEntity>> findAllBucket();
  //---------------------------------------------------------
  @Query('UPDATE bucketentity SET quantity=:quantity WHERE ID=:id')
  Future<void> updateQuantityInBucket(int quantity, String id);

  @Query("DELETE FROM bucketentity WHERE id=:id")
  Future<void> deleteBucketById(String id);

  @Query("DELETE FROM bucketentity WHERE isbucket=1")
  Future<void> deleteAllBucket();

  @Query("DELETE FROM bucketentity WHERE isfavourite=1")
  Future<void> deleteAllFavorites();

  @insert
  Future<void> insertIntoBucket(BucketEntity product);

  @update
  Future<void> updateBucket(BucketEntity product);

  @delete
  Future<void> deleteBucket(BucketEntity product);
}
