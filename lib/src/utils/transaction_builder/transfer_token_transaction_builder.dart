import 'dart:typed_data';

import 'package:web3dart/web3dart.dart';

import '../smartcontract.dart';
/// Transfer token transaction builder
class TransferTokenTransactionBuilder implements Transaction{
  /// sender address
  final String fromAddress;
  /// receipent address
  final String toAddress;
  /// token address
  final String contractAddress;
  /// amount in decimal token
  final BigInt amount;
  /// desired or estimated gas price (in wei)
  final BigInt? gasPrices;
  /// desired or estimated max gas amount (in wei)
  final BigInt? gasAmount; 
  /// nonce
  final int? nonces;
  TransferTokenTransactionBuilder({
    required this.fromAddress, /// sender address
    required this.toAddress, /// receipent address
    required this.contractAddress, /// token address
    required this.amount, /// amount in decimal token
    this.gasPrices, /// desired gas price (in wei)
    this.gasAmount, /// desired or estimated max gas amount (in wei)
    this.nonces, /// nonce
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
  ContractFunction get function => deployedContract.function('transfer');
  List<dynamic> get parameters => [
    receipent,
    amount,
  ];
  @override
  Uint8List? get data => deployedContract.function('transfer').encodeCall(
    parameters
  );


  @override
  EthereumAddress get from => EthereumAddress.fromHex(fromAddress);

  @override
  EthereumAddress get to => EthereumAddress.fromHex(contractAddress);

  EthereumAddress get receipent => EthereumAddress.fromHex(toAddress);

  @override
  EtherAmount? get gasPrice => gasPrices == null ? null : EtherAmount.inWei(gasPrices!);

  @override
  int? get maxGas => gasAmount == null ?  null :  gasAmount!.toInt();

  @override
  int? get nonce => nonces;

  @override
  EtherAmount get value => EtherAmount.zero();
}