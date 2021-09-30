// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_decimal_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenDecimalResponse _$GetTokenDecimalResponseFromJson(
    Map<String, dynamic> json) {
  return GetTokenDecimalResponse(
    decimals: BigInt.parse(json['decimals'] as String),
  );
}

Map<String, dynamic> _$GetTokenDecimalResponseToJson(
        GetTokenDecimalResponse instance) =>
    <String, dynamic>{
      'decimals': instance.decimals.toString(),
    };
