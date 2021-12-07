import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banner_slider.g.dart';

@JsonSerializable()
class BannerSlider {
  const BannerSlider({
    this.homeslider = const [],
  });

  final List<BannerModel> homeslider;

  factory BannerSlider.fromJson(Map<String, dynamic> json) =>
      _$BannerSliderFromJson(json);
  Map<String, dynamic> toJson() => _$BannerSliderToJson(this);
}
