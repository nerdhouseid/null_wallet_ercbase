import 'package:null_wallet_ercbase/src/wallet/wallet.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

var _mnemonic = 'social stomach omit clog carbon reward rail credit gasp two mobile dove';
var _privateKey = '0x1257e60bd3fd9e5c30ff056a23035374acbf9487a03a67d8b1a10d327d308c09';
var _address = '0xD6833B396CF0a4ce4AcB7E4B4e8629D9f31D29EF';
void main(){
  group(
    'Test Wallet : ',
    (){
      test(
        'wallet from mnemonic',
        (){
          var wallet = ErcBaseWallet.fromMnemonic(mnemonic: _mnemonic);
          expect(_address.toLowerCase(), wallet.address.toLowerCase());
        }
      );
      test(
        'wallet from private key',
        (){
          var wallet = ErcBaseWallet.fromPrivateKey(privateKey: _privateKey);
          expect(_address.toLowerCase(), wallet.address.toLowerCase());
        }
      );
    }
  );
}