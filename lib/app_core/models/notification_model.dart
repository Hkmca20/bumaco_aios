import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: 'notificationid')
  final String notificationid;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'iconurl')
  final String iconUrl;
  @JsonKey(name: 'imgurl')
  final String imgUrl;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'time')
  final String time;
  @JsonKey(name: 'flag')
  final bool flag;

  NotificationModel(
      {this.notificationid = '',
      this.type = '',
      this.title = '',
      this.iconUrl = '',
      this.imgUrl = '',
      this.message = '',
      this.time = '',
      this.flag = false});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
