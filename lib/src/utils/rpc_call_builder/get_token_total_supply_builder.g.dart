// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_total_supply_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenTotalSupplyResponse _$GetTokenTotalSupplyResponseFromJson(
    Map<String, dynamic> json) {
  return GetTokenTotalSupplyResponse(
    totalSupply: BigInt.parse(json['totalSupply'] as String),
  );
}

Map<String, dynamic> _$GetTokenTotalSupplyResponseToJson(
        GetTokenTotalSupplyResponse instance) =>
    <String, dynamic>{
      'totalSupply': instance.totalSupply.toString(),
    };
