import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../wallet/wallet.dart';
/// Transaction Rpc
class TransactionRpc{
  final http.Client httpClient = new http.Client();
  Future<BigInt> getGasPrice({
    required String url
  })async{
    var web3 = Web3Client(url, httpClient);
    var amount = await web3.getGasPrice();
    return amount.getInWei;
  }
  Future<BigInt> estimateGasAmount({
    required String url,
    Uint8List? data,
    required String sender,
    required String to,
    required BigInt value,
  })async{
    var gasPrice = await getGasPrice(url: url);
    var web3 = Web3Client(url, httpClient);
    var amount = await web3.estimateGas(
      gasPrice: EtherAmount.inWei(gasPrice),
      data: data,
      sender: EthereumAddress.fromHex(sender),
      to: EthereumAddress.fromHex(to),
      value: EtherAmount.inWei(value),
    );
    return amount;
  }
  Future<String> executeSmartContract({
    required String url,
    required int chainId,
    required ErcBaseWallet wallet,
    required Transaction transaction,
  })async{
    var web3 = Web3Client(url, httpClient);
    var cred = EthPrivateKey.fromHex(wallet.privateKey);
    var signedTransaction = await web3.signTransaction(
      cred,
      transaction,
      chainId: chainId,
    );
    var tx = await web3.sendRawTransaction(signedTransaction);
    return tx;
  }
  Future<String> transferBalance({
    required String url,
    required int chainId,
    required ErcBaseWallet wallet,
    required String to,
    required int gasAmount,
    required BigInt gasPrice,
    required BigInt value,
  })async{
    var web3 = Web3Client(url, httpClient);
    var cred = EthPrivateKey.fromHex(wallet.privateKey);
    var nonce = await web3.getTransactionCount(EthereumAddress.fromHex(wallet.address));
    var transaction = Transaction(
      from: EthereumAddress.fromHex(wallet.address),
      to: EthereumAddress.fromHex(to),
      nonce: nonce,
      gasPrice: EtherAmount.inWei(gasPrice),
      maxGas: gasAmount,
      value: EtherAmount.inWei(value),
    );
    var tx = await web3.sendTransaction(
      cred,
      transaction,
      chainId: chainId,
    );
    return tx;
  }
}