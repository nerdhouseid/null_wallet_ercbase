import 'dart:typed_data';

import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';

import '../../ercbase.dart';
import 'function.dart';
class Bip32{
  final bip32.BIP32 node;
  Bip32({
    required this.node,
  });
  factory Bip32.fromSeed({required Uint8List seed}){
    return Bip32(node: bip32.BIP32.fromSeed(seed));
  }
  Bip32 derivedPath(){
    return Bip32(node:node.derivePath(WalletConstant.DERIVATION_PATH).derive(0));
  }
  Uint8List get privateKeyBytes{
    if(this.node.privateKey == null){
      throw Exception("Cannot get private key");
    }
    return this.node.privateKey!;
  }
  Uint8List get publicKeyBytes{
    return this.node.publicKey;
  }
  String get privateKeywith0x{
    return with0x(value: HEX.encode(this.privateKeyBytes));
  }
  String get publicKeyWith0x{
    return with0x(value: HEX.encode(this.publicKeyBytes));
  }
  String get publicKey{
    return HEX.encode(this.publicKeyBytes);
  }
  String get privateKey{
    return HEX.encode(this.privateKeyBytes);
  }
}