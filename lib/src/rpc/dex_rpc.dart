
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../utils/rpc_call_builder/get_pair_builder.dart';
import '../utils/rpc_call_builder/get_reserves_builder.dart';
import '../utils/rpc_call_builder/rpc_call_builder.dart';

class DexRpc{
  final http.Client httpClient = http.Client();

  Future<GetReservesResponse> getReserves({
    required String url,
    required RpcCallBuilder builder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetReservesResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
  Future<GetPairResponse> getPair({
    required String url,
    required RpcCallBuilder builder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response  = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetPairResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
  Future<GetAmountInResponse> getAmountIn({
    required String url,
    required RpcCallBuilder builder
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response  = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetAmountInResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
  Future<GetAmountOutputResponse> getAmountOut({
    required String url,
    required RpcCallBuilder builder
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response  = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      return GetAmountOutputResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
}