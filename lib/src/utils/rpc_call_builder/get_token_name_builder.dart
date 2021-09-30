import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';

part 'get_token_name_builder.g.dart';
/// GetTokenNameBuilder
/// 
/// Used to get token name
class GetTokenNameBuilder extends RpcCallBuilder{
  final String address;
  GetTokenNameBuilder({
    required this.address
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.tokenJsonAbi, 'ERC-20'),
      EthereumAddress.fromHex(address),
    ),
    contractAddress: address,
    function: 'name',
    parameters: [],
  );
}
@JsonSerializable()
class GetTokenNameResponse extends Equatable{
  @JsonKey(defaultValue: 'ERC-20')
  final String name;
  GetTokenNameResponse({
    required this.name
  });
  factory GetTokenNameResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      throw Exception('Cannot get token name : Response is empty');
    }
    return GetTokenNameResponse(
      name: (json[0] as String),
    );
  }
  factory GetTokenNameResponse.fromJson(Map<String, dynamic> json) => _$GetTokenNameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTokenNameResponseToJson(this);

  @override
  List<Object?> get props => [
    name,
  ];
}