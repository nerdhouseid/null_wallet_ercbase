import 'package:null_wallet_ethereum/src/rpc/token_rpc.dart';
import 'package:http/http.dart' as http;
import 'package:null_wallet_ethereum/src/utils/rpc_call_builder/get_token_total_supply_builder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
void main(){
  var httpClient = http.Client();
  var tokenRpc = TokenRpc(httpClient: httpClient);
  var address = '0xe9e7cea3dedca5984780bafc599bd69add087d56'; // BUSD Address
  var expectedTotalSupply = BigInt.parse('4450999399956203280118531921');
  var url = 'https://bsc-dataseed1.defibit.io/s';
  group(
    'get token supply test : ',
    (){
      test(
        'Should return expected supply',
        ()async{
          var response = await tokenRpc.getTokenTotalSupply(
            builder: GetTokenTotalSupplyBuilder(address: address),
            url: url
          );
          expect(response.totalSupply, expectedTotalSupply);
        }
      );
    }
  );
}