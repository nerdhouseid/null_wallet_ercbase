import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';

part 'get_allowance_builder.g.dart';
class GetAllowanceBuilder extends RpcCallBuilder{
  final String ownerAddress;
  final String spenderAddress;
  final String tokenAddress;
  GetAllowanceBuilder({
    required this.ownerAddress,
    required this.spenderAddress,
    required this.tokenAddress,
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.tokenJsonAbi, 'Token'),
      EthereumAddress.fromHex(tokenAddress),
    ),
    contractAddress: tokenAddress,
    function: 'allowance',
    parameters: [
      EthereumAddress.fromHex(ownerAddress),
      EthereumAddress.fromHex(spenderAddress),
    ]
  );
}
@JsonSerializable()
class GetAllowanceResponse extends Equatable{
  final BigInt amount;
  GetAllowanceResponse({
    required this.amount,
  });
  factory GetAllowanceResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      return GetAllowanceResponse(
        amount: BigInt.zero,
      );
    }
    return GetAllowanceResponse(
      amount: (json[0] as BigInt),
    );
  }
  factory GetAllowanceResponse.fromJson(Map<String, dynamic> json) => _$GetAllowanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllowanceResponseToJson(this);

  @override
  List<Object?> get props => [amount];
}