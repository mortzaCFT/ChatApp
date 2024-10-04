import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/screen/chatScreen.dart'; // Assuming you have ChatScreen in this path

class usersRow extends StatelessWidget {
  final String walletAddress;

  const usersRow({
    super.key,
    required this.walletAddress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatScreen(walletAddress: walletAddress));
      },
      child: Container(
        width: double.infinity,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(Icons.account_circle, size: 60),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    walletAddress,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                  ),
                  Text(
                    "", 
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("02:00"), 
                  SizedBox(height: 5),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 217, 0), 
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "2", // Number of unread messages
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
