import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/web3dart.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';
import 'rpc_call_builder.dart';

part 'get_pair_builder.g.dart';

@JsonSerializable()
class GetPairResponse extends Equatable{
  final String lpAddress;
  GetPairResponse({
    required this.lpAddress,
  });

  factory GetPairResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      return GetPairResponse(
        lpAddress: ConstantAddres.ZERO_ADDRESS,
      );
    }
    return GetPairResponse(
      lpAddress: (json[0] as EthereumAddress).hex,
    );
  }
  factory GetPairResponse.fromJson(Map<String, dynamic> json) => _$GetPairResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPairResponseToJson(this);

  GetPairResponse copyWith({
    String? lpAddress,
  }){
    return GetPairResponse(
      lpAddress: lpAddress ?? this.lpAddress,
    );
  }
  @override
  List<Object?> get props => [
    lpAddress,
  ];
}

class GetPairBuilder extends RpcCallBuilder{
  final String factoryAddress;
  final String token1Address;
  final String token0Address;

  GetPairBuilder({
    required this.factoryAddress,
    required this.token0Address,
    required this.token1Address,
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.dexFactoryJsonAbi, 'Factory'),
      EthereumAddress.fromHex(factoryAddress),
    ),
    contractAddress: factoryAddress,
    function: 'getPair',
    parameters: [
      EthereumAddress.fromHex(token0Address),
      EthereumAddress.fromHex(token1Address),
    ],
  );
  GetPairBuilder copyWith({
    String? factoryAddress,
    String? token0Address,
    String? token1Address,
  }){
    return GetPairBuilder(
      factoryAddress: factoryAddress ?? this.factoryAddress,
      token0Address: token0Address ?? this.token0Address,
      token1Address: token1Address ?? this.token1Address,
    );
  }
}