import 'dart:math';

import 'package:null_wallet_ethereum/ercbase.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/web3dart.dart';

void main(){
  var _fromAddress = '0x1107c3c8Fc6C40c109A0E77762a69b25e927348B';
  var _contractAddress = '0xdbc941fec34e8965ebc4a25452ae7519d6bdfc4e';
  // example amount with token decimal (18)
  var _amount = BigInt.from(0.1 * pow(10, 18));
  var transaction = UnwrappingWethTransactionBuilder(
    fromAddress: _fromAddress, 
    contractAddress: _contractAddress,
    amount: _amount,
  );
  group(
    'Wrapping eth transaction builder test : ',
    (){
      test(
        'transaction function must be withdraw',
        (){
          expect(transaction.function.name, 'withdraw');
        }
      );
      group(
        'transaction parameters test : ',
        (){
          test(
            'transaction parameters length must be 1',
            (){
              expect(transaction.parameters.length, 1);
            }
          );
          test(
            'transaction parameters first value must be same with desired amount',
            (){
              expect(transaction.parameters[0], _amount);
            }
          );
        }
      );
      test(
        'transaction to property must be same with expected contract address',
        (){
          expect(transaction.to.hex.toLowerCase(), _contractAddress.toLowerCase());
        }
      );
      test(
        'transaction from property must be same with expected from address',
        (){
          expect(transaction.from.hex.toLowerCase(), _fromAddress.toLowerCase());
        }
      );

      test(
        'transaction value property must be zero',
        (){
          expect(transaction.value, EtherAmount.zero());
        }
      );
    }
  );
}