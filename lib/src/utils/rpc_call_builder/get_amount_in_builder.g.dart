// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_amount_in_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAmountInResponse _$GetAmountInResponseFromJson(Map<String, dynamic> json) =>
    GetAmountInResponse(
      amountIn: BigInt.parse(json['amountIn'] as String),
    );

Map<String, dynamic> _$GetAmountInResponseToJson(
        GetAmountInResponse instance) =>
    <String, dynamic>{
      'amountIn': instance.amountIn.toString(),
    };
