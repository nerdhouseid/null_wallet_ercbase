import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

import '../smartcontract.dart';
import 'rpc_call_builder.dart';

part 'get_amount_out_builder.g.dart';

/// get amount output
/// 
/// useful for getting token output price before swapping

class GetAmountOutputBuilder extends RpcCallBuilder{
  /// amount of output
  final BigInt amountIn;
  /// input token address
  final String inputAddress;
  /// output token address
  final String outputAddress;
  /// router address
  final String routerAddress;
  GetAmountOutputBuilder({
    required this.amountIn,
    required this.inputAddress,
    required this.outputAddress,
    required this.routerAddress,
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.uniswapRouterJsonAbi, 'Router'),
      EthereumAddress.fromHex(routerAddress),
    ),
    contractAddress: routerAddress,
    function: 'getAmountsOut',
    parameters: [
      amountIn,
      [
        EthereumAddress.fromHex(inputAddress),
        EthereumAddress.fromHex(outputAddress),
      ]
    ]
  );
}
@JsonSerializable()
class GetAmountOutputResponse extends Equatable{
  final BigInt amountOut;
  GetAmountOutputResponse({
    required this.amountOut,
  });

  factory GetAmountOutputResponse.fromRpc(List<dynamic> json){
    if(json.isNotEmpty){
      if(json.first is List){
        if((json.first as List).isNotEmpty){
          return GetAmountOutputResponse(amountOut: json.first[1]);
        }
      }
    }
    return GetAmountOutputResponse(
      amountOut : BigInt.zero,
    );
  }
  factory GetAmountOutputResponse.fromJson(Map<String, dynamic> json) => _$GetAmountOutputResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAmountOutputResponseToJson(this);

  @override
  List<Object?> get props => [
    amountOut,
  ];
}