import 'dart:math';

import 'package:null_wallet_ercbase/ercbase.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

void main(){
  var _outputAddress = '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2';
  var _inputAddress = '0xdac17f958d2ee523a2206206994597c13d831ec7';
  var _routerAddress = '0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D';
  var _fromAddress = '0xD6833B396CF0a4ce4AcB7E4B4e8629D9f31D29EF';
  var _amountOut = BigInt.from(0.1 * pow(10, 18));
  var _amountIn = BigInt.from(10 * pow(10,6));
  var path = List<dynamic>.from([
    EthereumAddress.fromHex(_inputAddress),
    EthereumAddress.fromHex(_outputAddress),
  ]);
  var deadline = DateTime.now().add(Duration(minutes: 30)).millisecondsSinceEpoch;
  var transaction = SwapTokenForEthTransactionBuilder(
    amountIn: _amountIn, 
    amountOut: _amountOut, 
    inputAddress: _inputAddress, 
    outputAddress: _outputAddress, 
    routerAddress: _routerAddress, 
    fromAddress: _fromAddress, 
    deadline: deadline
  );
  group(
    'swap eth for token transaction builder test : ',
    (){
      test(
        'transaction function must be swapExactTokensForETH',
        (){
          expect(transaction.function.name, 'swapExactTokensForETH');
        }
      );
      group(
        'transaction parameters',
        (){
          test(
            'transaction parameter length must be 5',
            (){
              expect(transaction.parameters.length, 5);
            }
          );
          test(
            'transaction first parameter value must be same with desired amount input',
            (){
              expect(_amountIn, transaction.parameters[0]);
            }
          );
          test(
            'transaction first parameter value must be same with desired amount output',
            (){
              expect(_amountOut, transaction.parameters[1]);
            }
          );
          test(
            'transaction second parameter value must be same with [_inputAddress, _outputAddress]',
            (){
              expect(transaction.parameters[2],path);
            }
          );
          test(
            'transaction third parameter value must be same with fromAddress',
            (){
              expect(transaction.from, EthereumAddress.fromHex(_fromAddress));
              expect(transaction.parameters[3],EthereumAddress.fromHex(_fromAddress));
            }
          );
          test(
            'transaction fourth parameter value must be same with deadline',
            (){
              expect(transaction.parameters[4],BigInt.from(deadline));
            }
          );
        }
      );
      test(
        'transaction value must be zero',
        (){
          expect(transaction.value, EtherAmount.zero());
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