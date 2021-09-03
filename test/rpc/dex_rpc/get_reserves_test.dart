import 'package:null_wallet_ercbase/src/rpc/dex_rpc.dart';
import 'package:null_wallet_ercbase/src/utils/rpc_call_builder/get_reserves_builder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main()async{
  var _lpAddress = '0x58F876857a02D6762E0101bb5C46A8c1ED44Dc16';
  var _invalidLpAddress = '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c';
  var _getReservesBuilder = GetReservesBuilder(
    lpAddress: _lpAddress
  );
  var _dexRpc = DexRpc();
  var _url = 'https://bsc-dataseed1.defibit.io/';
  
  group(
    'get reserves test : ',
    (){
      test(
        'must be return GetReservesResponse when get reserves was successfull',
        ()async{
          var _response = await _dexRpc.getReserves(
            url: _url, 
            builder: _getReservesBuilder
          );
          expect(_response, isA<GetReservesResponse>());
        }
      );
      test(
        'must throw exception when get reserves was fail',
        (){
          var _response = _dexRpc.getReserves(
            url: _url, 
            builder: _getReservesBuilder.copyWith(
              lpAddress: _invalidLpAddress
            )
          );
          expect(()=>_response, throwsA(isA<Exception>()));
        }
      );
    }
  );
}