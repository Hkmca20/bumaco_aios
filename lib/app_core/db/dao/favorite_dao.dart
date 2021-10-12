import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavouriteDao {
  @Query('SELECT * FROM favouriteentity')
  Future<List<FavouriteEntity>> findAllFavourites();

  @Query('SELECT * FROM favouriteentity')
  Stream<List<FavouriteEntity>> findAllFavAsStream();

  @Query('SELECT * FROM favouriteentity WHERE id = :id')
  Future<FavouriteEntity?> findFavouriteById(String id);

  @Query('SELECT * FROM favouriteentity ORDER BY id DESC LIMIT 1')
  Future<FavouriteEntity?> findMaxFavourite();

  @Query('SELECT * FROM favouriteentity ORDER BY id DESC')
  Stream<List<FavouriteEntity>> fetchStreamFavourite();

  @insert
  Future<void> insertIntoFavourite(FavouriteEntity product);

  @update
  Future<void> updateFavourire(FavouriteEntity product);

  @delete
  Future<void> deleteFavourire(FavouriteEntity product);

  @Query("DELETE FROM favouriteentity WHERE id = :id")
  Future<void> deleteFavourireById(String id);

  @delete
  Future<int> deleteAllFavourire(List<FavouriteEntity> list);
}
