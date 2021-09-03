import 'dart:typed_data';

import 'package:null_wallet_ercbase/src/utils/bip39.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
var _mnemonic = 'social stomach omit clog carbon reward rail credit gasp two mobile dove';

Uint8List _seedBytes = Uint8List.fromList([236, 162, 114, 212, 111, 2, 151, 229, 157, 167, 189, 0, 85, 150, 82, 234, 106, 58, 106, 178, 255, 157, 94, 26, 168, 122, 201, 242, 38, 249, 68, 82, 230, 247, 197, 66, 176, 139, 27, 54, 243, 92, 139, 213, 68, 67, 41, 51, 70, 102, 193, 156, 51, 206, 79, 145, 112, 68, 0, 75, 226, 14, 177, 122]);

void main(){
  group(
    'Test Bip39 : ',
    (){
      test(
        'should return false when mnemonic was not valid',
        (){
          var valid = Bip39.validateMnemnoic(mnemonic: _mnemonic+'OK');
          expect(false, valid);
        }
      );
      test(
        'should return true when mnemonic was valid',
        (){
          var valid = Bip39.validateMnemnoic(mnemonic: _mnemonic);
          expect(true, valid);
        }
      );
      test(
        'generated seedbytes must be same seedbytes test',
        (){
          var seed = Bip39.mnemonicToSeed(mnemonic: _mnemonic);
          expect(_seedBytes, seed);
        }
      );
    }
  );
}