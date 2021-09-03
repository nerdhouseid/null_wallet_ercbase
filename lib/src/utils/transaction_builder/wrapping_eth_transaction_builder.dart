import 'dart:typed_data';

import 'package:web3dart/web3dart.dart';

import '../smartcontract.dart';

class WrappingEthTransactionBuilder implements Transaction{
  final String fromAddress;
  final String contractAddress;
  final BigInt? gasPrices;
  final BigInt? gasAmount; 
  final int? nonces;
  final BigInt amount;
  WrappingEthTransactionBuilder({
    required this.fromAddress,
    required this.contractAddress,
    this.gasAmount,
    this.gasPrices,
    this.nonces,
    required this.amount,
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
    return ContractAbi.fromJson(SmartContract.wrappedTokenAbi, 'ERC-20');
  }
  DeployedContract get deployedContract{
    return DeployedContract(
      abi,
      to,
    );
  }
  ContractFunction get function => deployedContract.function('deposit');

  List<dynamic> get parameters => [
    
  ];
  @override
  Uint8List? get data => deployedContract.function('deposit').encodeCall(
    []
  );

  @override
  EthereumAddress get to => EthereumAddress.fromHex(contractAddress);

  @override
  EthereumAddress get from => EthereumAddress.fromHex(fromAddress);

  @override
  EtherAmount? get gasPrice => gasPrices == null ? null : EtherAmount.inWei(gasPrices!);

  @override
  int? get maxGas => gasAmount == null ? null : gasAmount!.toInt();

  @override
  int? get nonce => nonces;

  @override
  EtherAmount get value => EtherAmount.inWei(amount);

}