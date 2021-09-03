// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reserves_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReservesResponse _$GetReservesResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['reserve0', 'reserve1'],
  );
  return GetReservesResponse(
    reserve0: BigInt.parse(json['reserve0'] as String),
    reserve1: BigInt.parse(json['reserve1'] as String),
  );
}

Map<String, dynamic> _$GetReservesResponseToJson(
        GetReservesResponse instance) =>
    <String, dynamic>{
      'reserve0': instance.reserve0.toString(),
      'reserve1': instance.reserve1.toString(),
    };
