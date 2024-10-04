import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/AppBarController.dart';

class CustomBottomAppBar extends StatelessWidget {
  
  final AppBarController _controller = Get.put(AppBarController());
  final bool isDialogVisible; 

  CustomBottomAppBar({Key? key, required this.isDialogVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ClipRRect(
        child: Container(
          
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: isDialogVisible
                      ? Colors.transparent
                      : Colors.blueGrey.shade50),
            ),
            color:
                isDialogVisible ? Colors.black.withOpacity(0.6) : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(65, 15, 65, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {_controller.toggleIcon(0); 
                    Get.toNamed("/home");
                  },
                  child: Icon(
                    Icons.home_outlined,
                    size: 30,
                    color: _controller.selectedIndex.value == 0
                        ? Colors.black
                        : Colors.black26,
                  ),
                ),
                GestureDetector(
                  onTap: _controller.toggleDialog,
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _controller.isDialogVisible.value
                          ? Colors.white
                          : Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        _controller.isDialogVisible.value
                            ? "Cancel"
                            : "New Chat",
                        style: TextStyle(
                          color: _controller.isDialogVisible.value
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _controller.toggleIcon(1); 
                    Get.toNamed("/profile");
                  },
                  child: Icon(
                    Icons.person_outlined,
                    size: 30,
                    color: _controller.selectedIndex.value == 1
                        ? Colors.black
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
