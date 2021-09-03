A ErcBase library from Null Wallet.
[![Dart](https://github.com/nerdhouseid/null_wallet_ercbase/actions/workflows/dart.yml/badge.svg?branch=develop)](https://github.com/nerdhouseid/null_wallet_ercbase/actions/workflows/dart.yml)

## Usage

Creating Wallet:

```dart
  var mnemonic = "social stomach omit clog carbon reward rail credit gasp two mobile dove";
  var wallet = ErcBaseWallet.fromMnemonic(mnemonic: mnemonic);
   // wallet address
  print(wallet.address);
  // private key wallet
  print(wallet.privateKey);
  // public key wallet
  print(wallet.publicKey);
```

Using Transaction Builder :

```dart
  var gasPrice = BigInt.from(1000000000);
  // 1000000000 (wei)
  var transactionBuilder = TransferTokenTransaction(
    fromAddress: wallet.address, // sender address 
    toAddress: "0x1f511296513Af2001F80a45309c7D5FcDc03738C", // receipent address
    contractAddress: "0x07d169f52fcb96a9f56325f510528e0d65ca4952",  // token address (DAI Testnet),
    amount: BigInt.from(
      1 * pow(10, 18)
    ), // amount in decimal token (18)
    gasPrices: gasPrice,
  );
```
Using Transaction RPC : 
```dart
  var kucoinRpcTestnet = "https://rpc-testnet.kcc.network";
  var kucoinTestnetChainId = 322;
  var transactionRpc = TransactionRpc();
  // get current gas price
  var gasPrice = await transactionRpc.getGasPrice(url: kucoinRpcTestnet);
  // 1000000000 (wei)
  print(gasPrice);

  // estimate gas amount
  var gasAmount = await transactionRpc.estimateGasAmount(
    sender: transactionBuilder.from.hex,
    to: transactionBuilder.to.hex,
    url: kucoinRpcTestnet,
    value: transactionBuilder.value.getInWei,
    data: transactionBuilder.data,
  );
  // 41256
  print(gasAmount);
  
  // always use Transaction builder for executing smart contract
  var executeSmartContract = await transactionRpc.executeSmartContract(
    url: kucoinRpcTestnet, 
    chainId: kucoinTestnetChainId, 
    wallet: wallet, 
    transaction: transactionBuilder.copyWith(
      gasPrice: EtherAmount.inWei(gasPrice),
      maxGas: gasAmount.toInt()
    )
  );
  // 0xe6b20a2470018115441de97d6f906308b38a4a2961f8a2ce6b29eebbaeaf95b1
  print(executeSmartContract);
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
