import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';

part 'get_balance_of_token_builder.g.dart';
/// GetBalanceOfTokenBuilder
/// 
/// Used to get balance of token
class GetBalanceOfTokenBuilder extends RpcCallBuilder{
  final String tokenAddress;
  final String walletAddress;
  GetBalanceOfTokenBuilder({
    required this.tokenAddress,
    required this.walletAddress,
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.tokenJsonAbi, 'ERC-20'),
      EthereumAddress.fromHex(tokenAddress),
    ),
    contractAddress: tokenAddress,
    function: 'balanceOf',
    parameters: [
      EthereumAddress.fromHex(walletAddress)
    ],
  );
}
@JsonSerializable()
class GetBalanceOfTokenResponse extends Equatable{
  final BigInt balance;
  GetBalanceOfTokenResponse({
    required this.balance
  });
  factory GetBalanceOfTokenResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      throw Exception('Cannot get balance of token : Response is empty');
    }
    return GetBalanceOfTokenResponse(
      balance: (json[0] as BigInt),
    );
  }
  factory GetBalanceOfTokenResponse.fromJson(Map<String, dynamic> json) => _$GetBalanceOfTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBalanceOfTokenResponseToJson(this);

  @override
  List<Object?> get props => [
    balance,
  ];
}