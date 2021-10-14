import 'package:floor/floor.dart';

@entity
class NotificationEntity {
  @primaryKey
  final String notificationid;
  final String type;
  final String title;
  final String iconUrl;
  final String imgUrl;
  final String message;
  final String time;
  final bool flag;

  NotificationEntity(this.notificationid, this.type, this.title, this.iconUrl,
      this.imgUrl, this.message, this.time, this.flag);
}
