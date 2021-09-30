// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_symbol_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenSymbolResponse _$GetTokenSymbolResponseFromJson(
    Map<String, dynamic> json) {
  return GetTokenSymbolResponse(
    symbol: json['symbol'] as String? ?? 'ERC-20',
  );
}

Map<String, dynamic> _$GetTokenSymbolResponseToJson(
        GetTokenSymbolResponse instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
    };
