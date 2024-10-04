import 'package:get/get.dart';

class AppBarController extends GetxController {
  
  var isDialogVisible = false.obs;
  var selectedIndex = 0.obs;

  void toggleDialog() {
    isDialogVisible.value = !isDialogVisible.value;
  }

  void toggleIcon(int index) {
    selectedIndex.value = index;
  }
}