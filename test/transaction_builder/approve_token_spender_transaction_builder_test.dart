import 'package:null_wallet_ethereum/ercbase.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

void main(){
  var _fromAddress = '0x1107c3c8Fc6C40c109A0E77762a69b25e927348B';
  var _spenderAddress = '0x1f511296513Af2001F80a45309c7D5FcDc03738C';
  var _contractAddress = '0xdbc941fec34e8965ebc4a25452ae7519d6bdfc4e';
  var transaction = ApproveTokenSpenderTransactionBuilder(
    fromAddress: _fromAddress, 
    contractAddress: _contractAddress, 
    spenderAddress: _spenderAddress,
  );
  group(
    'Approve token spending test : ',
    (){
      test(
        'transaction function must be approve',
        (){
          expect(transaction.function.name,'approve');
        }
      );
      group(
        'transaction parameter ',
        (){
          test(
            'transaction parameter length must be 2',
            (){
              expect(transaction.parameters.length,2);
            }
          );
          test(
            'transaction first parameter value must be EthereumAddress',
            (){
              expect(transaction.parameters[0], isA<EthereumAddress>());
            }
          );
          test(
            'transaction first parameter value must be same with spender address',
            (){
              expect((transaction.parameters[0] as EthereumAddress).hex.toLowerCase(), _spenderAddress.toLowerCase());
            }
          );
          test(
            'transaction second parameter value type must be BigInt',
            (){
              expect(transaction.parameters[1], isA<BigInt>());
            }
          );
          test(
            'transaction second parameter value must be same with constant allowance value',
            (){
              expect((transaction.parameters[1] as BigInt), BigInt.from(ConstantNumber.allowance));
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
        'transaction spender property must be same with expected spender address',
        (){
          expect(transaction.spender.hex.toLowerCase(), _spenderAddress.toLowerCase());
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