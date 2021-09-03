import 'dart:typed_data';

import 'package:null_wallet_ercbase/src/utils/smartcontract.dart';
import 'package:web3dart/web3dart.dart';

class SwapTokenForEthTransactionBuilder implements Transaction{
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
  final double slippage;
  SwapTokenForEthTransactionBuilder({
    required this.amountIn,
    required this.amountOut,
    required this.inputAddress,
    required this.outputAddress,
    required this.routerAddress,
    required this.fromAddress,
    required this.deadline,
    this.gasAmount,
    this.nonces,
    this.gasPrices,
    this.slippage = 0.5,
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
    return deployedContract.function('swapExactTokensForETH');
  }
  List<dynamic> get parameters{
    return [
      amountIn,
      amountOutMinSlippage,
      path,
      from,
      BigInt.from(deadline),
    ];
  }
  List<dynamic> get path{
    return [
      EthereumAddress.fromHex(inputAddress),
      EthereumAddress.fromHex(outputAddress),
    ];
  }
  @override
  Uint8List get data => function.encodeCall(
    [parameters]
  );
  BigInt get amountOutMinSlippage{
    return amountOut - (amountOut * BigInt.from((slippage / 100)));
  }
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
  EtherAmount get value => EtherAmount.zero();
  
}