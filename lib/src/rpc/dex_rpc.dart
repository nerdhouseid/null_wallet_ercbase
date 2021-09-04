
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../utils/rpc_call_builder/get_pair_builder.dart';
import '../utils/rpc_call_builder/get_reserves_builder.dart';
import '../utils/rpc_call_builder/get_swap_data_builder.dart';
import '../utils/rpc_call_builder/get_token0_address_builder.dart';
import '../utils/rpc_call_builder/rpc_call_builder.dart';

class DexRpc{
  final http.Client httpClient = http.Client();
  Future<GetToken0AddressResponse> getToken0Address({
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
      return GetToken0AddressResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
  Future<GetReservesResponse> getReserves({
    required String url,
    required GetReservesBuilder builder,
    required GetToken0AddressBuilder getToken0AddressBuilder,
  })async{
    try{
      var web3 = Web3Client(url, httpClient);
      var response = await web3.call(
        contract: builder.contract,
        function: builder.contract.function(builder.function),
        params: builder.parameters,
      );
      var response2 = await getToken0Address(url: url, builder: getToken0AddressBuilder);
      var _builder = builder;
      print(response2.token0Address);
      if(response2.token0Address.toLowerCase() != builder.token0Address.toLowerCase()){
        _builder = _builder.copyWith(
          token1Address: builder.token0Address,
          token0Address: builder.token1Address,
        );
      }
      return GetReservesResponse.fromRpc(
        response,
        _builder.token0Address,
        _builder.token1Address,
      );
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
  GetSwapDataResponse getSwapDataResponse({
    required GetReservesResponse getReservesResponse,
    required BigInt amount,
    required String tokenAddress,
    required bool isReserveIn
  }){
    try{
      var priceImpact = getPriceImpact(
        getReservesResponse: getReservesResponse, 
        tokenAddress: tokenAddress, 
        amount: amount, 
        isReserveIn: isReserveIn
      );
      return GetSwapDataResponse(
        amount: amount, 
        priceImpact: priceImpact,
      );
    }catch(e){
      throw Exception(e);
    }
  }
  double getPriceImpact({
    required GetReservesResponse getReservesResponse,
    required String tokenAddress,
    required BigInt amount,
    required bool isReserveIn,
  }){
    var reserves = getReservesResponse.reserve0;
    var priceImpact = (amount / reserves) * 100;
    if(tokenAddress.toLowerCase() == getReservesResponse.token1Address.toLowerCase()){
      reserves = getReservesResponse.reserve1;
      priceImpact  = (amount / reserves) * 100;
    }
    if(!isReserveIn){
      priceImpact = priceImpact * (-1);
    }
    return priceImpact;
  }
  Future<GetAllowanceResponse> getAllowance({
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
      return GetAllowanceResponse.fromRpc(response);
    } on RangeError{
      throw Exception('Invalid range');
    }
    catch(e){
      throw Exception(e);
    }
  }
}