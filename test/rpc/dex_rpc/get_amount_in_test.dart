import 'package:null_wallet_ercbase/src/rpc/dex_rpc.dart';
import 'package:null_wallet_ercbase/src/utils/rpc_call_builder/get_amount_in_builder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  var _inputAddress = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  var _outputAddress = '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c';
  var _amountOut = BigInt.from(1000000000000000000.00);
  var _routerAddress = '0x10ed43c718714eb63d5aa57b78b54704e256024e';
  var _builder = GetAmountInputBuilder(
    amountOut: _amountOut,
    inputAddress: _inputAddress,
    outputAddress: _outputAddress,
    routerAddress: _routerAddress,
  );
  var _dexRpc = DexRpc();
  var _url = 'https://bsc-dataseed1.defibit.io/';
  group(
    'get amount in test : ',
    (){
      test(
        'return GetAmountInputResponse when successfull',
        ()async{
          var _response = await _dexRpc.getAmountIn(url: _url, builder: _builder);
          print(_response.amountIn);
          expect(_response, isA<GetAmountInResponse>());
        }
      );
    }
  );
}