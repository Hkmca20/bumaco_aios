import 'dart:async';
import 'package:bumaco_aios/app_core/db/dao/bucket_dao.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:bumaco_aios/app_core/db/dao/favorite_dao.dart';
import 'package:bumaco_aios/app_core/models/models.dart';

part 'database.g.dart';

@Database(version: DB_VERSION, entities: [ProductModel])
abstract class AppDatabase extends FloorDatabase {
  FavouriteDao get favouriteDao;
  BucketDao get bucketDao;

  static Future<AppDatabase> init() async {
    AppDatabase instance =
        await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    return instance;
  }
}
