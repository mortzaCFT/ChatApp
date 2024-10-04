import 'package:chatapp/controllers/AppBarController.dart';
import 'package:chatapp/controllers/InputController.dart';
import 'package:chatapp/screen/chatScreen.dart';
import 'package:chatapp/screen/components/bottomappbar.dart';
import 'package:chatapp/screen/components/dialogBox.dart';
import 'package:chatapp/screen/components/header.dart';
import 'package:chatapp/screen/components/storyRow.dart';
import 'package:chatapp/screen/components/userRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppBarController _controller = Get.put(AppBarController());
    final Inputcontroller _chatController = Get.put(Inputcontroller()); // NewChatController added

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 20),
                const storyRow(),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 25, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chats",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.more_horiz_sharp),
                    ],
                  ),
                ),
                Obx(() {
                  return Column(
                    children: _chatController.chats.map((walletAddress) {
                      return usersRow(walletAddress: walletAddress);
                    }).toList(),
                  );
                }),
              ],
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

          // Dialog box
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
