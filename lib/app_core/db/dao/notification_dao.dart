import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class NotificationDao {
  @Query('SELECT * FROM notificationentity')
  Future<List<NotificationEntity>> findAllNotification();

  @Query('SELECT * FROM notificationentity WHERE notificationid = :notificationid')
  Future<NotificationEntity?> findNotificationById(String notificationid);

  @Query("DELETE FROM notificationentity WHERE notificationid = :notificationid")
  Future<void> deleteAddressById(String notificationid);

  @insert
  Future<void> insertNotification(NotificationEntity entity);

  @update
  Future<void> updateNotification(NotificationEntity entity);

  @delete
  Future<void> deleteNotification(NotificationEntity entity);
}
