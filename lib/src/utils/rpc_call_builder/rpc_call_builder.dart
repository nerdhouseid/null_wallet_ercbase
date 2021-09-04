import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

export 'get_amount_in_builder.dart';
export 'get_amount_out_builder.dart';
export 'get_pair_builder.dart';
export 'get_reserves_builder.dart';
export 'get_swap_data_builder.dart';
export 'get_allowance_builder.dart';
export 'get_token0_address_builder.dart';

class RpcCallBuilder{
  final DeployedContract contract;
  final String function; 
  final List<dynamic> parameters;
  final String contractAddress;
  RpcCallBuilder({
    required this.contract,
    required this.parameters,
    required this.function,
    required this.contractAddress,
  });
  Uint8List get data {
    return contract.function(function).encodeCall(parameters);
  }
  EthereumAddress get smartContract => EthereumAddress.fromHex(contractAddress);
}
class RpcCallResponse extends Equatable{
  
  @override
  List<Object?> get props => [];
}