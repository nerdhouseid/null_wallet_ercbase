import 'package:null_wallet_ercbase/src/rpc/dex_rpc.dart';
import 'package:null_wallet_ercbase/src/utils/rpc_call_builder/get_reserves_builder.dart';
import 'package:null_wallet_ercbase/src/utils/rpc_call_builder/get_token0_address_builder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main()async{
  var _lpAddress = '0x58F876857a02D6762E0101bb5C46A8c1ED44Dc16';
  var _invalidLpAddress = '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c';
  var _token0Address = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  var _token1Address = '0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c';
  var _getReservesBuilder = GetReservesBuilder(
    lpAddress: _lpAddress,
    token0Address: _token0Address,
    token1Address: _token1Address,
  );
  var _getToken0AddressBuilder = GetToken0AddressBuilder(
    lpAddress: _lpAddress,
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
            builder: _getReservesBuilder,
            getToken0AddressBuilder: _getToken0AddressBuilder,
          );
          print(_response.token0Address);
          if(_response.token0Address.toLowerCase() == _token1Address.toLowerCase()){
            expect(_response.token1Address.toLowerCase(), _token0Address.toLowerCase());
          } else{
            expect(_response.token1Address.toLowerCase(), _token1Address.toLowerCase());
          }
          expect(_response, isA<GetReservesResponse>());
        }
      );
      test(
        'must throw exception when get reserves was fail',
        (){
          var _response = _dexRpc.getReserves(
            url: _url, 
            builder: _getReservesBuilder.copyWith(
              lpAddress: _invalidLpAddress,
            ),
            getToken0AddressBuilder: _getToken0AddressBuilder,
          );
          expect(()=>_response, throwsA(isA<Exception>()));
        }
      );
    }
  );
}