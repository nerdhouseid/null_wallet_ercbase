import 'package:null_wallet_ethereum/src/utils/rpc_call_builder/get_reserves_builder.dart';
import 'package:null_wallet_ethereum/src/utils/smartcontract.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

void main()async{
  var _lpAddress = '0x58F876857a02D6762E0101bb5C46A8c1ED44Dc16';
  var _token0Address = '0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c';
  var _token1Address = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  var _getReservesBuilder = GetReservesBuilder(
    lpAddress: _lpAddress,
    token0Address: _token0Address,
    token1Address: _token1Address,
  );
  var _contract = DeployedContract(
    ContractAbi.fromJson(SmartContract.pairFactoryJsonAbi, 'Pair'),
    EthereumAddress.fromHex(_lpAddress),
  );
  group(
    'get reserves builder test : ',
    (){
      test(
        'lpAddress, smartcontract, and contractAddress property in builder must be same with lpAddress',
        (){
          expect(_getReservesBuilder.lpAddress, _lpAddress);
          expect(_getReservesBuilder.smartContract, EthereumAddress.fromHex(_lpAddress));
          expect(_getReservesBuilder.contractAddress, _lpAddress);
        }
      );
      test(
        'contract property must be same with expected contract',
        (){
          for(var i=0; i<_getReservesBuilder.contract.events.length; i++){
            expect(_getReservesBuilder.contract.events[i].name, _contract.events[i].name);
          }
        }
      );
      test(
        'contract property must contain getReserves function',
        (){
          expect(_getReservesBuilder.contract.findFunctionsByName('getReserves').isNotEmpty, true);
        }
      );
      test(
        'paremeter property must be empty',
        (){
          expect(_getReservesBuilder.parameters.isEmpty, true);
        }
      );
      
    }
  );
}