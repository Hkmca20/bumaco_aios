import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  @JsonKey(name: 'addressid')
  final String addressid;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'street1')
  final String street1;
  @JsonKey(name: 'street2')
  final String street2;
  @JsonKey(name: 'locality')
  final String locality;
  @JsonKey(name: 'latitude')
  final String latitude;
  @JsonKey(name: 'longitude')
  final String longitude;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'state')
  final String state;
  @JsonKey(name: 'country')
  final String country;
  @JsonKey(name: 'pin_code')
  final String pinCode;
  @JsonKey(name: 'default')
  final bool isDefault;

  AddressModel({
    this.addressid = '',
    this.type = '',
    this.street1 = '',
    this.street2 = '',
    this.locality = '',
    this.latitude = '',
    this.longitude = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.pinCode = '',
    this.isDefault = false,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
