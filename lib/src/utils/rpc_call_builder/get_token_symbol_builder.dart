import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';

part 'get_token_symbol_builder.g.dart';
/// GetTokenSymbolBuilder
/// 
/// Used to get token symbol
class GetTokenSymbolBuilder extends RpcCallBuilder{
  final String address;
  GetTokenSymbolBuilder({
    required this.address
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.tokenJsonAbi, 'ERC-20'),
      EthereumAddress.fromHex(address),
    ),
    contractAddress: address,
    function: 'symbol',
    parameters: [],
  );
}
@JsonSerializable()
class GetTokenSymbolResponse extends Equatable{
  @JsonKey(defaultValue: 'ERC-20')
  final String symbol;
  GetTokenSymbolResponse({
    required this.symbol
  });
  factory GetTokenSymbolResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      throw Exception('Cannot get token symbol : Response is empty');
    }
    return GetTokenSymbolResponse(
      symbol: (json[0] as String),
    );
  }
  factory GetTokenSymbolResponse.fromJson(Map<String, dynamic> json) => _$GetTokenSymbolResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTokenSymbolResponseToJson(this);

  @override
  List<Object?> get props => [
    symbol,
  ];
}