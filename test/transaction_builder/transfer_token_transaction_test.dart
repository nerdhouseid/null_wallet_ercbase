import 'dart:typed_data';

import 'package:null_wallet_ercbase/src/utils/transaction_builder/transfer_token_transaction.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/credentials.dart';
Uint8List _data = Uint8List.fromList([169, 5, 156, 187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 81, 18, 150, 81, 58, 242, 0, 31, 128, 164, 83, 9, 199, 213, 252, 220, 3, 115, 140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 152, 150, 128]);
BigInt _amount = BigInt.from(10000000);
String _fromAddress = "0x1107c3c8Fc6C40c109A0E77762a69b25e927348B";
String _toAddress = "0x1f511296513Af2001F80a45309c7D5FcDc03738C";
String _contractAddress = "0xdbc941fec34e8965ebc4a25452ae7519d6bdfc4e";

void main(){
  var transaction = TransferTokenTransaction(
    fromAddress: _fromAddress, 
    toAddress: _toAddress, 
    contractAddress: _contractAddress, 
    amount: _amount,
  );
  group(
    "transfer token transaction test : ",
    (){
      test(
        'transaction function must be transfer',
        (){
          expect("transfer", transaction.function.name);
        }
      );
      group(
        'transaction parameter test : ',
        (){
          test(
            'transaction paramater length must be 2',
            (){
              expect(2, transaction.parameters.length);
            }
          );
          test(
            'transaction first paramaters value must be ethereum address',
            (){
              expect(transaction.parameters[0], isA<EthereumAddress>());
            }
          );
          test(
            'transaction first parameters value must be same with expected to address',
            (){
              expect(transaction.parameters[0], isA<EthereumAddress>());
              expect((transaction.parameters[0] as EthereumAddress).hex.toLowerCase(), _toAddress.toLowerCase());
            }
          );
          test(
            'transaction second paramets value must be same with expected amount transfer',
            (){
              expect(transaction.parameters[1] as BigInt, _amount);
            }
          );
        }
      );
      test(
        'generated data must be same with expected data',
        (){
          expect(_data, transaction.data);
        }
      );
      test(
        'from address must be same with expected from address',
        (){
          expect(_fromAddress.toLowerCase(), transaction.fromAddress.toLowerCase());
          expect(_fromAddress.toLowerCase(), transaction.from.hex.toLowerCase());
        }
      );
      test(
        'to address must be same with expected to address',
        (){
          expect(_toAddress.toLowerCase(), transaction.toAddress.toLowerCase());
          expect(_toAddress.toLowerCase(), transaction.receipent.hex.toLowerCase());
        }
      );
      test(
        'contract address must be same with expected contract address',
        (){
          expect(_contractAddress.toLowerCase(), transaction.contractAddress.toLowerCase());
          expect(_contractAddress.toLowerCase(), transaction.to.hex.toLowerCase());
        }
      );
    }
  );
}