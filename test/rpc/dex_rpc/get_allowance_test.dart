import 'package:null_wallet_ethereum/ercbase.dart';
import 'package:null_wallet_ethereum/src/rpc/dex_rpc.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  var _tokenAddress = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  var _ownerAddress = '0xD6833B396CF0a4ce4AcB7E4B4e8629D9f31D29EF';
  var _routerAddress = '0x10ed43c718714eb63d5aa57b78b54704e256024e';
  var _builder = GetAllowanceBuilder(
    ownerAddress: _ownerAddress,
    spenderAddress: _routerAddress,
    tokenAddress: _tokenAddress,
  );
  var _dexRpc = DexRpc();
  var _url = 'https://bsc-dataseed1.defibit.io/';
  group(
    'get amount in test : ',
    (){
      test(
        'return GetAllowanceResponse when successfull',
        ()async{
          var _response = await _dexRpc.getAllowance(url: _url, builder: _builder);
          print(_response.amount);
          expect(_response, isA<GetAllowanceResponse>());
        }
      );
    }
  );
}