// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token0_address_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetToken0AddressResponse _$GetToken0AddressResponseFromJson(
    Map<String, dynamic> json) {
  return GetToken0AddressResponse(
    token0Address: json['token0Address'] as String? ??
        '0x0000000000000000000000000000000000000000',
  );
}

Map<String, dynamic> _$GetToken0AddressResponseToJson(
        GetToken0AddressResponse instance) =>
    <String, dynamic>{
      'token0Address': instance.token0Address,
    };
