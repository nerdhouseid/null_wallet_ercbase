import 'package:null_wallet_ethereum/src/rpc/dex_rpc.dart';
import 'package:null_wallet_ethereum/src/utils/constant.dart';
import 'package:null_wallet_ethereum/src/utils/rpc_call_builder/get_pair_builder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
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
  var _dexRpc = DexRpc();
  var _url = 'https://bsc-dataseed1.defibit.io/';
  group(
    'get pair test : ',
    (){
      test(
        'should return response address when successfull',
        ()async{
           var _res = await _dexRpc.getPair(
            builder: _getPairBuilder,
            url: _url,
          );
          expect(EthereumAddress.fromHex(_res.lpAddress), isA<EthereumAddress>());
        }
      );
      test(
        'should throw exception when fail',
        (){
          var _res = _dexRpc.getPair(
            builder: _getPairBuilder.copyWith(
              factoryAddress: ConstantAddres.DEAD_ADDRESS
            ),
            url: _url,
          );
          expect(()=>_res, throwsA(isA<Exception>()));
        }
      );
    }
  );
}