import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:null_wallet_ercbase/src/utils/rpc_call_builder/rpc_call_builder.dart';
import 'package:null_wallet_ercbase/src/utils/smartcontract.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
part 'get_amount_in_builder.g.dart';

/// get amount input
/// 
/// useful for getting token input price before swapping

class GetAmountInputBuilder extends RpcCallBuilder{
  /// amount of input
  final BigInt amountOut;
  /// input token address
  final String inputAddress;
  /// output token address
  final String outputAddress;
  /// router address
  final String routerAddress;
  GetAmountInputBuilder({
    required this.amountOut,
    required this.inputAddress,
    required this.outputAddress,
    required this.routerAddress,
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.uniswapRouterJsonAbi, 'Router'),
      EthereumAddress.fromHex(routerAddress),
    ),
    contractAddress: routerAddress,
    function: 'getAmountsIn',
    parameters: [
      amountOut,
      [
        EthereumAddress.fromHex(inputAddress),
        EthereumAddress.fromHex(outputAddress),
      ]
    ]
  );
}

@JsonSerializable()
class GetAmountInResponse extends Equatable{
  final BigInt amountIn;
  GetAmountInResponse({
    required this.amountIn,
  });
  
  factory GetAmountInResponse.fromRpc(List<dynamic> json){
    if(json.isNotEmpty){
      if(json.first is List){
        if((json.first as List).isNotEmpty){
          return GetAmountInResponse(amountIn: json.first[0]);
        }
      }
    }
    return GetAmountInResponse(
      amountIn : BigInt.zero,
    );
  }
  factory GetAmountInResponse.fromJson(Map<String, dynamic> json) => _$GetAmountInResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAmountInResponseToJson(this);

  @override
  List<Object?> get props => [
    amountIn,
  ];
}