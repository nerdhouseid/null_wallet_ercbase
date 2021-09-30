import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';

part 'get_token_decimal_builder.g.dart';
/// GetTokenDecimalBuilder
/// 
/// Used to get token decimal
class GetTokenDecimalBuilder extends RpcCallBuilder{
  final String address;
  GetTokenDecimalBuilder({
    required this.address
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.tokenJsonAbi, 'ERC-20'),
      EthereumAddress.fromHex(address),
    ),
    contractAddress: address,
    function: 'decimals',
    parameters: [],
  );
}
@JsonSerializable()
class GetTokenDecimalResponse extends Equatable{
  final BigInt decimals;
  GetTokenDecimalResponse({
    required this.decimals
  });
  factory GetTokenDecimalResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      throw Exception('Cannot get token decimal : Response is empty');
    }
    return GetTokenDecimalResponse(
      decimals: (json[0] as BigInt),
    );
  }
  factory GetTokenDecimalResponse.fromJson(Map<String, dynamic> json) => _$GetTokenDecimalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTokenDecimalResponseToJson(this);

  @override
  List<Object?> get props => [
    decimals,
  ];
}