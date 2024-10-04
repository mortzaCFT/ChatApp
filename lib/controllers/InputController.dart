import 'package:get/get.dart';

class Inputcontroller extends GetxController {
  final _isWalletAddressFilled = false.obs;
  final _isWalletAddressValid = true.obs; 

  final RxList<String> chats = <String>[].obs; 

  bool get isWalletAddressFilled => _isWalletAddressFilled.value;
  bool get isWalletAddressValid => _isWalletAddressValid.value;

  bool isValidWalletAddress(String address) {
    final regex = RegExp(r'^0x[a-fA-F0-9]{40}$');
    return regex.hasMatch(address);
  }

  void checkWalletAddress(String text) {
    if (isValidWalletAddress(text)) {
      _isWalletAddressFilled.value = true;
      _isWalletAddressValid.value = true;  
    } else {
      _isWalletAddressFilled.value = false;
      _isWalletAddressValid.value = false;  
    }
  }

  void addChat(String walletAddress) {
    if (isValidWalletAddress(walletAddress)) {
      chats.add(walletAddress); 
    }
  }
}
