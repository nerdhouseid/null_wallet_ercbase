// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_name_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenNameResponse _$GetTokenNameResponseFromJson(Map<String, dynamic> json) {
  return GetTokenNameResponse(
    name: json['name'] as String? ?? 'ERC-20',
  );
}

Map<String, dynamic> _$GetTokenNameResponseToJson(
        GetTokenNameResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
