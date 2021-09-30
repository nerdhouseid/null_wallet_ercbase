// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_balance_of_token_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBalanceOfTokenResponse _$GetBalanceOfTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetBalanceOfTokenResponse(
    balance: BigInt.parse(json['balance'] as String),
  );
}

Map<String, dynamic> _$GetBalanceOfTokenResponseToJson(
        GetBalanceOfTokenResponse instance) =>
    <String, dynamic>{
      'balance': instance.balance.toString(),
    };
