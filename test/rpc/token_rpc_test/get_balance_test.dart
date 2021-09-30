import 'dart:math';

import 'package:null_wallet_ethereum/src/rpc/token_rpc.dart';
import 'package:http/http.dart' as http;
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
void main(){
  var httpClient = http.Client();
  var tokenRpc = TokenRpc(httpClient: httpClient);
  var address = '0xe9e7cea3dedca5984780bafc599bd69add087d56'; // BUSD Address
  var walletAddress = '0xEeCfd9658bAAc6D1b579FdBC6f0e778d6a228ec6';
  var expectedBalance = BigInt.parse('27066180000000000');
  var url = 'https://bsc-dataseed1.defibit.io/s';
  group(
    'get balance of token test : ',
    (){
      test(
        'Should return expected balance',
        ()async{
          var response = await tokenRpc.getBalance(
            walletAddress: walletAddress,
            url: url
          );
          expect(response, expectedBalance);
        }
      );
    }
  );
}