import 'package:chatapp/controllers/AppBarController.dart';
import 'package:chatapp/screen/components/bottomappbar.dart';
import 'package:chatapp/screen/components/dialogBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final AppBarController _controller = Get.put(AppBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
       
        children: [
           const SingleChildScrollView(
            child: const Column(
              children: [
                SizedBox(height: 20),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 25, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.settings_outlined,size: 30,),
                    ],
                  ),
                ),
                Icon(Icons.account_circle_outlined,size: 80,),
                SizedBox(height: 20,),
                Text("Hello `mortza`",style: TextStyle(fontSize: 20),),
                Text("Your wallet Address: 0x...",style: TextStyle(fontSize: 13),),
                
              ]
          ),
           ),

          Obx(() {
            if (_controller.isDialogVisible.value) {
              return Container(
                color: Colors.black.withOpacity(0.6),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          Obx(() {
            if (_controller.isDialogVisible.value) {
              return const dialogBox();
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
        bottomNavigationBar: Obx(() {
        return CustomBottomAppBar(
          isDialogVisible: _controller.isDialogVisible.value,
        );
      }),
    );
  }
}

