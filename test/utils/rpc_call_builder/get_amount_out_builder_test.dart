import 'package:null_wallet_ercbase/src/utils/rpc_call_builder/get_amount_out_builder.dart';
import 'package:null_wallet_ercbase/src/utils/smartcontract.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

void main(){
  var _inputAddress = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  var _outputAddress = '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c';
  var _amountIn = BigInt.from(494147709780013554110.00);
  var _routerAddress = '0x10ed43c718714eb63d5aa57b78b54704e256024e';
  var _contract = DeployedContract(
    ContractAbi.fromJson(SmartContract.uniswapRouterJsonAbi, 'Router'),
    EthereumAddress.fromHex(_routerAddress),
  );
  var _builder = GetAmountOutputBuilder(
    amountIn: _amountIn,
    inputAddress: _inputAddress,
    outputAddress: _outputAddress,
    routerAddress: _routerAddress,
  );
  group(
    'get amount in builder test : ',
    (){
      test(
        'routerAddress, contractAddress and smartContract property must be same with desired routerAddress',
        (){
          expect(_builder.routerAddress, _routerAddress);
          expect(_builder.contractAddress, _routerAddress);
          expect(_builder.smartContract, EthereumAddress.fromHex(_routerAddress));
        }
      );
      test(
        'amountIn property must be same with desired amountIn',
        (){
          expect(_builder.amountIn, _amountIn);
        }
      );
      test(
        'contract property must be same with desired contract',
        (){
          for(var i=0; i<_builder.contract.functions.length; i++){
            expect(_builder.contract.functions[i].name, _contract.functions[i].name);
          }
        }
      );
      test(
        'contract property must be contain getAmountsOut function',
        (){
          expect(_builder.contract.findFunctionsByName('getAmountsOut').isNotEmpty, true);
        }
      );
      group(
        'parameters property test : ',
        (){
          test(
            'parameters length must be 2',
            (){
              expect(_builder.parameters.length, 2);
            }
          );
          test(
            'first parameters value must be same with desired amountIn',
            (){
              expect(_builder.parameters[0], isA<BigInt>());
              expect((_builder.parameters[0] as BigInt), _amountIn);
              expect((_builder.parameters[0] as BigInt), _builder.amountIn);
            }
          );
          test(
            'second parameters value must be same with [_inputAddress, _outputAddress]',
            (){
              expect(
                _builder.parameters[1], 
                [
                  EthereumAddress.fromHex(_inputAddress),
                  EthereumAddress.fromHex(_outputAddress)
                ]
              );
            }
          );
        }
      );
    }
  );
}