import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/web3dart.dart';

import '../smartcontract.dart';
import 'rpc_call_builder.dart';

part 'get_reserves_builder.g.dart';
@JsonSerializable()
class GetReservesResponse extends Equatable{
  @JsonKey(
    required: true
  )
  final BigInt reserve0;
  @JsonKey(
    required: true
  )
  final BigInt reserve1;
  final String token0Address;
  final String token1Address;
  GetReservesResponse({
    required this.reserve0,
    required this.reserve1,
    required this.token0Address,
    required this.token1Address,
  });

  factory GetReservesResponse.fromRpc(List<dynamic> json, String token0Address, String token1Address){
    if(json.isEmpty){
      return GetReservesResponse(
        reserve0: BigInt.zero,
        reserve1: BigInt.zero,
        token0Address : token0Address,
        token1Address : token1Address,
      );
    }
    return GetReservesResponse(
      reserve0: BigInt.parse(json[0].toString()), 
      reserve1: BigInt.parse(json[1].toString()),
      token0Address : token0Address,
      token1Address : token1Address,
    );
  }
  factory GetReservesResponse.fromJson(Map<String, dynamic> json) => _$GetReservesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetReservesResponseToJson(this);

  @override
  List<Object?> get props => [
    reserve0,
    reserve1,
  ];
}

class GetReservesBuilder extends RpcCallBuilder{
  final String lpAddress;
  final String token0Address;
  final String token1Address;

  GetReservesBuilder({
    required this.lpAddress,
    required this.token0Address,
    required this.token1Address,
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.pairFactoryJsonAbi, 'Pair'),
      EthereumAddress.fromHex(lpAddress),
    ),
    contractAddress: lpAddress,
    function: 'getReserves',
    parameters: [],
  );
  GetReservesBuilder copyWith({
    String? lpAddress,
    String? token1Address,
    String? token0Address,
  }){
    return GetReservesBuilder(
      lpAddress: lpAddress ?? this.lpAddress,
      token0Address: token0Address ?? this.token0Address,
      token1Address: token1Address ?? this.token1Address
    );
  }
}