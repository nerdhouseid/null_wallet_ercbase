import 'package:null_wallet_ethereum/src/rpc/token_rpc.dart';
import 'package:http/http.dart' as http;
import 'package:null_wallet_ethereum/src/utils/rpc_call_builder/get_token_symbol_builder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
void main(){
  var httpClient = http.Client();
  var tokenRpc = TokenRpc(httpClient: httpClient);
  var address = '0xe9e7cea3dedca5984780bafc599bd69add087d56'; // BUSD Address
  var expectedSymbol = 'BUSD';
  var url = 'https://bsc-dataseed1.defibit.io/s';
  group(
    'get token symbol test : ',
    (){
      test(
        'Should return expected symbol',
        ()async{
          var response = await tokenRpc.getTokenSymbol(
            builder: GetTokenSymbolBuilder(address: address),
            url: url
          );
          expect(response.symbol, expectedSymbol);
        }
      );
    }
  );
}