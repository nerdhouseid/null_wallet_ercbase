import 'dart:typed_data';

import 'package:null_wallet_ethereum/src/utils/bip32.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

Uint8List _seedBytes = Uint8List.fromList([236, 162, 114, 212, 111, 2, 151, 229, 157, 167, 189, 0, 85, 150, 82, 234, 106, 58, 106, 178, 255, 157, 94, 26, 168, 122, 201, 242, 38, 249, 68, 82, 230, 247, 197, 66, 176, 139, 27, 54, 243, 92, 139, 213, 68, 67, 41, 51, 70, 102, 193, 156, 51, 206, 79, 145, 112, 68, 0, 75, 226, 14, 177, 122]);
var _privateKey = '0x1257e60bd3fd9e5c30ff056a23035374acbf9487a03a67d8b1a10d327d308c09';
var _publicKey = '0x028340a27dc0229d6e72c44453f6768ac4e4e21e8385f0523518cee956105ee88a';
void main(){
  var bip32 = Bip32.fromSeed(seed: _seedBytes);
  group(
    'Test Bip32 : ',
    (){
      test(
        'generated private key must be same with private key test set',
        (){
          var derived = bip32.derivedPath();
          expect(_privateKey, derived.privateKeywith0x);
        }
      );
      test(
        'generated public key must be same with public key test set',
        (){
          var derived = bip32.derivedPath();
          expect(_publicKey, derived.publicKeyWith0x);
        }
      );
    }
  );
}