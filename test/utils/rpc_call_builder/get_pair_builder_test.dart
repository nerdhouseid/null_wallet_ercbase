import 'package:null_wallet_ethereum/src/utils/rpc_call_builder/get_pair_builder.dart';
import 'package:null_wallet_ethereum/src/utils/smartcontract.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

void main()async{
  var _token0Address = '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c';
  var _token1Address = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  var _factoryAddress = '0xca143ce32fe78f1f7019d7d551a6402fc5350c73';
  var _getPairBuilder = GetPairBuilder(
    factoryAddress: _factoryAddress,
    token0Address: _token0Address,
    token1Address: _token1Address,
  );
  var _contract = DeployedContract(
    ContractAbi.fromJson(SmartContract.dexFactoryJsonAbi, 'Factory'),
    EthereumAddress.fromHex(_factoryAddress),
  );
  group(
    'get pair builder test : ',
    (){
      test(
        'factoryAddress, token0Address, and token1Address property in builder must be same with desired input',
        (){
          expect(_getPairBuilder.factoryAddress, _factoryAddress);
          expect(_getPairBuilder.token0Address, _token0Address);
          expect(_getPairBuilder.token1Address, _token1Address);
        }
      );
      test(
        'contractAddress, smartContract property in builder must be same with factoryAddress',
        (){
          expect(_getPairBuilder.contractAddress, _factoryAddress);
          expect(_getPairBuilder.smartContract, EthereumAddress.fromHex(_factoryAddress));
        }
      );
      test(
        'contract property must be same with expected contract',
        (){
          for(var i=0; i<_getPairBuilder.contract.events.length; i++){
            expect(_getPairBuilder.contract.events[i].name, _contract.events[i].name);
          }
        }
      );
      test(
        'contract property must contain getPair function',
        (){
          expect(_getPairBuilder.contract.findFunctionsByName('getPair').isNotEmpty, true);
        }
      );
      test(
        'paremeter property must be 2',
        (){
          expect(_getPairBuilder.parameters.length, 2);
        }
      );
      
    }
  );
}