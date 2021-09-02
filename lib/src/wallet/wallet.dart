import 'dart:typed_data';

import 'package:hex/hex.dart';
import 'package:secp256k1/secp256k1.dart';
import 'package:web3dart/crypto.dart';

import '../utils/bip32.dart';
import '../utils/bip39.dart';
import '../utils/function.dart';

class ErcBaseWallet{
  final String privateKey;
  final String publicKey;
  final String mnemonic;
  final String address;
  ErcBaseWallet._({
    required this.privateKey,
    required this.publicKey,
    required this.mnemonic,
    required this.address,
  });
  factory ErcBaseWallet.fromMnemonic({
    required String mnemonic,
    String phrase = "",
  }){
    var seed = Bip39.mnemonicToSeed(mnemonic: mnemonic,passphrase: phrase,);
    var bip32 = Bip32.fromSeed(seed: seed);
    var derivedNode = bip32.derivedPath();
    var privateKey = PrivateKey.fromHex(derivedNode.privateKey);
    var address = HEX.encode(keccak256(Uint8List.fromList(HEX.decode(privateKey.publicKey.toHex()).sublist(1))).sublist(12,32));
    return ErcBaseWallet._(
      privateKey: privateKey.toHex(), 
      publicKey: privateKey.publicKey.toHex(), 
      mnemonic: mnemonic,
      address: with0x(value: address)
    );
  }
  factory ErcBaseWallet.newWallet(){
    var mnemonic = Bip39.generateMnemonic();
    var seed = Bip39.mnemonicToSeed(mnemonic: mnemonic);
    var bip32 = Bip32.fromSeed(seed: seed);
    var derivedNode = bip32.derivedPath();
    var privateKey = PrivateKey.fromHex(derivedNode.privateKey);
    var address = HEX.encode(keccak256(Uint8List.fromList(HEX.decode(privateKey.publicKey.toHex()).sublist(1))).sublist(12,32));
    return ErcBaseWallet._(
      privateKey: privateKey.toHex(), 
      publicKey: privateKey.publicKey.toHex(), 
      mnemonic: mnemonic,
      address: with0x(value: address)
    );
  }
  factory ErcBaseWallet.fromPrivateKey({
    required String privateKey,
  }){
    var pk = PrivateKey.fromHex(cut0x(value: privateKey));
    var address = HEX.encode(keccak256(Uint8List.fromList(HEX.decode(pk.publicKey.toHex()).sublist(1))).sublist(12,32));
    return ErcBaseWallet._(
      privateKey: pk.toHex(), 
      publicKey: pk.publicKey.toHex(), 
      mnemonic: "",
      address: with0x(value: address)
    );
  }
}