// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_allowance_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllowanceResponse _$GetAllowanceResponseFromJson(Map<String, dynamic> json) {
  return GetAllowanceResponse(
    amount: BigInt.parse(json['amount'] as String),
  );
}

Map<String, dynamic> _$GetAllowanceResponseToJson(
        GetAllowanceResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount.toString(),
    };
