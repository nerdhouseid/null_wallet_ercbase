import 'dart:math';

import 'package:null_wallet_ethereum/ercbase.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

void main(){
  var _inputAddress = '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2';
  var _outputAddress = '0xdac17f958d2ee523a2206206994597c13d831ec7';
  var _routerAddress = '0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D';
  var _fromAddress = '0xD6833B396CF0a4ce4AcB7E4B4e8629D9f31D29EF';
  var _amountIn = BigInt.from(0.1 * pow(10, 18));
  var _amountOut = BigInt.from(10 * pow(10,6));
  var path = List<dynamic>.from([
    EthereumAddress.fromHex(_inputAddress),
    EthereumAddress.fromHex(_outputAddress),
  ]);
  var deadline = DateTime.now().add(Duration(minutes: 30)).millisecondsSinceEpoch;
  var transaction = SwapEthForTokenTransactionBuilder(
    amountIn: _amountIn, 
    amountOut: _amountOut, 
    inputAddress: _inputAddress, 
    outputAddress: _outputAddress, 
    routerAddress: _routerAddress, 
    fromAddress: _fromAddress, 
    deadline: deadline
  );
  var _slippage = 0.5;
  var _amountOutMinSlippage = _amountOut - (_amountOut * BigInt.from((_slippage / 100)));
  group(
    'swap eth for token transaction builder test : ',
    (){
      test(
        'transaction function must be swapExactETHForTokens',
        (){
          expect(transaction.function.name, 'swapExactETHForTokens');
        }
      );
      group(
        'transaction parameters',
        (){
          test(
            'transaction parameter length must be 4',
            (){
              expect(transaction.parameters.length, 4);
            }
          );
          test(
            'transaction parameter length must be 4',
            (){
              expect(transaction.parameters.length, 4);
            }
          );
          test(
            'transaction first parameter value must be same with desired amount output',
            (){
              expect(_amountOutMinSlippage, transaction.parameters[0]);
            }
          );
          test(
            'transaction second parameter value must be same with [_inputAddress, _outputAddress]',
            (){
              expect(transaction.parameters[1],path);
            }
          );
          test(
            'transaction third parameter value must be same with fromAddress',
            (){
              expect(transaction.from, EthereumAddress.fromHex(_fromAddress));
              expect(transaction.parameters[2],EthereumAddress.fromHex(_fromAddress));
            }
          );
          test(
            'transaction fourth parameter value must be same with deadline',
            (){
              expect(transaction.parameters[3],BigInt.from(deadline));
            }
          );
        }
      );
      test(
        'transaction value must be same with desired inputAmount',
        (){
          expect(transaction.value, EtherAmount.inWei(_amountIn));
        }
      );
      test(
        'transaction from must be same with fromAddress',
        (){
          expect(transaction.from, EthereumAddress.fromHex(_fromAddress));
        }
      );
      test(
        'transaction to must be same with routerAddress',
        (){
          expect(transaction.to, EthereumAddress.fromHex(_routerAddress));
        }
      );
      test(
        'transaction path must be same with [_inputAddres, _outputAddress]',
        (){
          expect(transaction.path,path);
        }
      );
    }
  );
}