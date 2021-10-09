import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavouriteDao {
  @Query('SELECT * FROM productmodel')
  Future<List<ProductModel>> findAllFavourites();

  @Query('SELECT * FROM productmodel')
  Stream<List<ProductModel>> findAllFavAsStream();

  @Query('SELECT * FROM productmodel WHERE id = :id')
  Future<ProductModel?> findFavouriteById(String id);

  @Query('SELECT * FROM productmodel ORDER BY id DESC LIMIT 1')
  Future<ProductModel?> findMaxFavourite();

  @Query('SELECT * FROM productmodel ORDER BY id DESC')
  Stream<List<ProductModel>> fetchStreamFavourite();

  @insert
  Future<void> insertIntoFavourite(ProductModel product);

  @update
  Future<void> updateFavourire(ProductModel product);

  @delete
  Future<void> deleteFavourire(ProductModel product);

  @Query("DELETE FROM productmodel WHERE id = :id")
  Future<void> deleteFavourireById(String id);

  @delete
  Future<int> deleteAllFavourire(List<ProductModel> list);
}
