import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';

part 'get_token_total_supply_builder.g.dart';
/// GetTokenTotalSupplyBuilder
/// 
/// Used to get token totalSupply
class GetTokenTotalSupplyBuilder extends RpcCallBuilder{
  final String address;
  GetTokenTotalSupplyBuilder({
    required this.address
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.tokenJsonAbi, 'ERC-20'),
      EthereumAddress.fromHex(address),
    ),
    contractAddress: address,
    function: 'totalSupply',
    parameters: [],
  );
}
@JsonSerializable()
class GetTokenTotalSupplyResponse extends Equatable{
  final BigInt totalSupply;
  GetTokenTotalSupplyResponse({
    required this.totalSupply
  });
  factory GetTokenTotalSupplyResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      throw Exception('Cannot get token totalSupply : Response is empty');
    }
    return GetTokenTotalSupplyResponse(
      totalSupply: (json[0] as BigInt),
    );
  }
  factory GetTokenTotalSupplyResponse.fromJson(Map<String, dynamic> json) => _$GetTokenTotalSupplyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTokenTotalSupplyResponseToJson(this);

  @override
  List<Object?> get props => [
    totalSupply,
  ];
}