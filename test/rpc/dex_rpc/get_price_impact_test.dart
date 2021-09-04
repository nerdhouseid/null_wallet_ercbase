import 'package:null_wallet_ethereum/ercbase.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  var _getReservedResponse = GetReservesResponse(
    reserve0: BigInt.from(28547116529470411381443.00),
    reserve1: BigInt.from(111687118568202),
    token0Address: '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2',
    token1Address: '0xdac17f958d2ee523a2206206994597c13d831ec7'
  );
  var _dexRpc = DexRpc();
  var _priceImpact = _dexRpc.getPriceImpact(
    getReservesResponse: _getReservedResponse, 
    tokenAddress: '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2', 
    amount: BigInt.from(999828615974734790.00), 
    isReserveIn: false
  ); 
  var _priceImpact2 = _dexRpc.getPriceImpact(
    getReservesResponse: _getReservedResponse, 
    tokenAddress: '0xdac17f958d2ee523a2206206994597c13d831ec7', 
    amount: BigInt.from(3920530385.00), 
    isReserveIn: true
  ); 
  test(
    'expected price impact must be same',
    (){
      print(_priceImpact); 
      print(_priceImpact2);
      expect(-0.003502380406590518, _priceImpact);
      expect(0.003510279820323164, _priceImpact2);
    }
  );
  var _getReservedResponse2 = GetReservesResponse(
    reserve0: BigInt.from(499892505547437040803412.00), 
    reserve1: BigInt.from(253021722195442011131345634.00), 
    token0Address: '0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c', 
    token1Address: '0xe9e7cea3dedca5984780bafc599bd69add087d56'
  );
  var _priceImpact3 = _dexRpc.getPriceImpact(
    getReservesResponse: _getReservedResponse2, 
    tokenAddress: '0xe9e7cea3dedca5984780bafc599bd69add087d56', 
    amount: BigInt.from(509590870400420813528.00), 
    isReserveIn: true
  );
  var _priceImpact4 = _dexRpc.getPriceImpact(
    getReservesResponse: _getReservedResponse2, 
    tokenAddress: '0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c', 
    amount: BigInt.from(1000000000000000000.00), 
    isReserveIn: false
  );
  test(
    'expected price impact must be same',
    (){
      print(_priceImpact3); 
      print(_priceImpact4);
      expect(0.00020140202429212644, _priceImpact3);
      expect(-0.00020004300702705885, _priceImpact4);
    }
  );
}