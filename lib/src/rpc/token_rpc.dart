import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../utils/rpc_call_builder/get_balance_of_token_builder.dart';
import '../utils/rpc_call_builder/get_token_decimal_builder.dart';
import '../utils/rpc_call_builder/get_token_name_builder.dart';
import '../utils/rpc_call_builder/get_token_symbol_builder.dart';
import '../utils/rpc_call_builder/get_token_total_supply_builder.dart';

/// TokenRpC
/// 
/// a class to interract with token smart contract
class TokenRpc{
  final http.Client httpClient;
  TokenRpc({
    required this.httpClient,
  });

  /// getTokenDecimal
  ///
  /// if getTokenDecimalSuccess will return token decimal response with proper data
  /// or will throw Exception if fail
  Future<GetTokenDecimalResponse> getTokenDecimals({
    required String url,
    required GetTokenDecimalBuilder builder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetTokenDecimalResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }

  /// getTokenName
  ///
  /// if getTokenName Success will return token name response with proper data
  /// or will throw Exception if fail
  Future<GetTokenNameResponse> getTokenName({
    required String url,
    required GetTokenNameBuilder builder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetTokenNameResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }

  /// getTokenSymbol
  ///
  /// if getTokenSymbol Success will return token symbol response with proper data
  /// or will throw Exception if fail
  Future<GetTokenSymbolResponse> getTokenSymbol({
    required String url,
    required GetTokenSymbolBuilder builder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetTokenSymbolResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }

  /// getTokenTotalSupply
  ///
  /// if getTokenTotalSupply Success will return token total supply response with proper data
  /// or will throw Exception if fail
  Future<GetTokenTotalSupplyResponse> getTokenTotalSupply({
    required String url,
    required GetTokenTotalSupplyBuilder builder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetTokenTotalSupplyResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
  /// getBalanceOfToken
  ///
  /// if getBalanceOfToken Success will return token balance
  /// or will throw Exception if fail
  Future<GetBalanceOfTokenResponse> getBalanceOfToken({
    required String url,
    required GetBalanceOfTokenBuilder builder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetBalanceOfTokenResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }

  /// getBalance
  ///
  /// if getBalance Success will return token balance
  /// or will throw Exception if fail
  Future<BigInt> getBalance({
    required String url,
    required String walletAddress,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.getBalance(EthereumAddress.fromHex(walletAddress));
      return response.getInWei;
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
}