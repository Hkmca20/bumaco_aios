import 'dart:async';
import 'package:bumaco_aios/app_core/db/dao/daos.dart';
import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
part 'app_database.g.dart';

@Database(version: DB_VERSION, entities: [
  FavouriteEntity,
  BucketEntity,
  AddressEntity,
  NotificationEntity
])
abstract class AppDatabase extends FloorDatabase {
  FavouriteDao get favouriteDao;
  BucketDao get bucketDao;
  AddressDao get addressDao;
  NotificationDao get notificationDao;

  static Future<AppDatabase> init() async {
    AppDatabase instance =
        await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    return instance;
  }
}
