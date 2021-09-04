import 'package:null_wallet_ethereum/src/rpc/dex_rpc.dart';
import 'package:null_wallet_ethereum/src/utils/rpc_call_builder/rpc_call_builder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  var _inputAddress = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  var _outputAddress = '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c';
  var _amountIn = BigInt.from(493284751045141463304.00);
  var _routerAddress = '0x10ed43c718714eb63d5aa57b78b54704e256024e';
  var _builder = GetAmountOutputBuilder(
    amountIn: _amountIn,
    inputAddress: _inputAddress,
    outputAddress: _outputAddress,
    routerAddress: _routerAddress,
  );
  var _dexRpc = DexRpc();
  var _url = 'https://bsc-dataseed1.defibit.io/';
  group(
    'get amount out test : ',
    (){
      test(
        'return GetAmountOutputResponse when successfull',
        ()async{
          var _response = await _dexRpc.getAmountOut(url: _url, builder: _builder);
          print(_response.amountOut);
          expect(_response, isA<GetAmountOutputResponse>());
        }
      );
    }
  );
}