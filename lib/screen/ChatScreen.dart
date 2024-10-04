import 'package:chatapp/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ChatController.dart';
//import '../controllers/DeleteChatController.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final ChatController _chatController = Get.put(ChatController());
 // final DeleteChatController _delController = Get.put(DeleteChatController());

  final String walletAddress;

  ChatScreen({required this.walletAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed("/home");
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                ),
                SizedBox(width: 0),
                Icon(Icons.account_circle_outlined, size: 48),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      walletAddress,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " offline",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(width: 220,),
                Icon(Icons.call_outlined,),
            
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 2, color: Colors.blueGrey.shade50),
            Expanded(
              child: Obx(() {
                if (_chatController.messages.isEmpty) {
                  return Center(
                    child: Text("No messages"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _chatController.messages.length,
                    itemBuilder: (context, index) {
                      Message message = _chatController.messages[index];
                      return Align(
                        alignment: message.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: IntrinsicWidth(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: message.isMe
                                  ? Colors.yellow
                                  : Color.fromARGB(14, 100, 100, 100),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              message.message,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 1),
              child: Row(
                children: [
                     IconButton(
                  icon: Icon(Icons.delete_outline, size: 30, color: Colors.black26),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete Chat'),
                          content: Text(
                              'Are you sure you want to delete the chat with $walletAddress?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                            //    _delController.deleteChat(walletAddress); 
                                Get.toNamed("/home"); 
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 35,
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "send a message..",
                          fillColor: Colors.white38,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.send_rounded, size: 30),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        _chatController.sendMessage(
                            _messageController.text, true); 
                        _messageController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
