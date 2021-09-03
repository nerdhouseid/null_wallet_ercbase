import 'dart:typed_data';

import 'package:web3dart/web3dart.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';

class ApproveTokenSpenderTransactionBuilder implements Transaction{
  final String fromAddress;
  final String contractAddress;
  final String spenderAddress;
  final BigInt? gasPrices;
  final BigInt? gasAmount; 
  final int? nonces;
  ApproveTokenSpenderTransactionBuilder({
    required this.fromAddress,
    required this.contractAddress,
    required this.spenderAddress,
    this.gasAmount,
    this.gasPrices,
    this.nonces,
  });

  @override
  Transaction copyWith({EthereumAddress? from, EthereumAddress? to, int? maxGas, EtherAmount? gasPrice, EtherAmount? value, Uint8List? data, int? nonce}) {
    return Transaction(
      from: from ?? this.from,
      data: data ?? this.data,
      gasPrice: gasPrice ?? this.gasPrice,
      maxGas: maxGas ?? this.maxGas,
      nonce: nonce ?? this.nonce,
      to: to ?? this.to,
      value: value ?? this.value,
    );
  }
  ContractAbi get abi{
    return ContractAbi.fromJson(SmartContract.tokenJsonAbi, 'ERC-20');
  }
  DeployedContract get deployedContract{
    return DeployedContract(
      abi,
      to,
    );
  }
  ContractFunction get function => deployedContract.function('approve');
  List<dynamic> get parameters => [
    spender,
    BigInt.from(ConstantNumber.allowance),
  ];
  @override
  Uint8List? get data => deployedContract.function('approve').encodeCall(
    parameters
  );

  @override
  EthereumAddress get to => EthereumAddress.fromHex(contractAddress);

  @override
  EthereumAddress get from => EthereumAddress.fromHex(fromAddress);
  
  EthereumAddress get spender => EthereumAddress.fromHex(spenderAddress);

  @override
  EtherAmount? get gasPrice => gasPrices == null ? null : EtherAmount.inWei(gasPrices!);

  @override
  int? get maxGas => gasAmount == null ? null : gasAmount!.toInt();

  @override
  int? get nonce => nonces;

  @override
  EtherAmount get value => EtherAmount.zero();

}