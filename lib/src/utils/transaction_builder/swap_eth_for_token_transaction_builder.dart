import 'dart:typed_data';

import 'package:web3dart/web3dart.dart';

import '../smartcontract.dart';

class SwapEthForTokenTransactionBuilder implements Transaction{
  final BigInt amountIn;
  final BigInt amountOut;
  final String inputAddress;
  final String outputAddress;
  final String routerAddress;
  final String fromAddress;
  final int deadline;
  final BigInt? gasPrices;
  final BigInt? gasAmount;
  final int? nonces;
  SwapEthForTokenTransactionBuilder({
    required this.amountIn,
    required this.amountOut,
    required this.inputAddress,
    required this.outputAddress,
    required this.routerAddress,
    required this.fromAddress,
    required this.deadline,
    this.gasAmount,
    this.nonces,
    this.gasPrices
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
  ContractAbi get contractAbi{
    return ContractAbi.fromJson(SmartContract.uniswapRouterJsonAbi, 'Router');
  }
  DeployedContract get deployedContract{
    return DeployedContract(contractAbi, to);
  }
  ContractFunction get function{
    return deployedContract.function('swapExactETHForTokens');
  }
  List<dynamic> get path => [
    EthereumAddress.fromHex(inputAddress),
    EthereumAddress.fromHex(outputAddress),
  ];
  List<dynamic> get parameters{
    return [
      amountOut,
      path,
      from,
      BigInt.from(deadline),
    ];
  }
  @override
  Uint8List get data => function.encodeCall(
    [parameters]
  );

  @override
  EthereumAddress get from => EthereumAddress.fromHex(fromAddress);

  @override
  EtherAmount? get gasPrice => gasPrices == null ? null : EtherAmount.inWei(gasPrices!);

  @override
  int? get maxGas => gasAmount == null ? null : gasAmount!.toInt();

  @override
  int? get nonce => nonces;

  @override
  EthereumAddress get to => EthereumAddress.fromHex(routerAddress);

  @override
  EtherAmount get value => EtherAmount.inWei(amountIn);
  
}