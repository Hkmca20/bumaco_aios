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
    final database = await $FloorAppDatabase
        .databaseBuilder(DB_NAME)
        // .addMigrations([migration1to2])
        // .addCallback(callback)
        .build();
    return database;
  }
  // In-Memory Database
  // final database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
}
// create migration
// final migration1to2 = Migration(1, 2, (database) {
//   database.execute('ALTER TABLE person ADD COLUMN nickname TEXT');
// });

// Callback
// final callback = Callback(
//   onCreate: (database, version) {/* database has been created */},
//   onOpen: (database) {/* database has been opened */},
//   onUpgrade: (database, startVersion, endVersion) {
//     /* database has been upgraded */
//   },
// );
