import 'dart:math';

import 'package:null_wallet_ethereum/ercbase.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  var _fromAddress = '0x1107c3c8Fc6C40c109A0E77762a69b25e927348B';
  var _contractAddress = '0xdbc941fec34e8965ebc4a25452ae7519d6bdfc4e';
  // example amount with token decimal (18)
  var _amount = BigInt.from(0.1 * pow(10, 18));
  var transaction = WrappingEthTransactionBuilder(
    fromAddress: _fromAddress, 
    contractAddress: _contractAddress,
    amount: _amount,
  );
  group(
    'Wrapping eth transaction builder test : ',
    (){
      test(
        'transaction function must be deposit',
        (){
          expect(transaction.function.name, 'deposit');
        }
      );
      test(
        'transaction parameters must be empty',
        (){
          expect(transaction.parameters.isEmpty, true);
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
        'transaction value property must be same with desired amount',
        (){
          expect(transaction.value.getInWei, _amount);
        }
      );
    }
  );
}