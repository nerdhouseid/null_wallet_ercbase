import 'dart:typed_data';
import 'package:bip39/bip39.dart' as bip39;

class Bip39{
  static String generateMnemonic(){
    return bip39.generateMnemonic();
  }
  static Uint8List mnemonicToSeed({required String mnemonic, String passphrase= "" }){
    return bip39.mnemonicToSeed(mnemonic,passphrase: passphrase);
  }
  static bool validateMnemnoic({required String mnemonic}){
    return bip39.validateMnemonic(mnemonic);
  }
}