// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_amount_out_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAmountOutputResponse _$GetAmountOutputResponseFromJson(
        Map<String, dynamic> json) =>
    GetAmountOutputResponse(
      amountOut: BigInt.parse(json['amountOut'] as String),
    );

Map<String, dynamic> _$GetAmountOutputResponseToJson(
        GetAmountOutputResponse instance) =>
    <String, dynamic>{
      'amountOut': instance.amountOut.toString(),
    };
