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
  GetReservesResponse({
    required this.reserve0,
    required this.reserve1
  });

  factory GetReservesResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      return GetReservesResponse(
        reserve0: BigInt.zero,
        reserve1: BigInt.zero,
      );
    }
    return GetReservesResponse(
      reserve0: BigInt.parse(json[0].toString()), 
      reserve1: BigInt.parse(json[1].toString()),
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

  GetReservesBuilder({
    required this.lpAddress
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
    String? lpAddress
  }){
    return GetReservesBuilder(lpAddress: lpAddress ?? this.lpAddress);
  }
}