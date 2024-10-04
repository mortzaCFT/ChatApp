import 'package:chatapp/screen/components/newchat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dialogBox extends StatelessWidget {
  const dialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 20,
      right: 20,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               GestureDetector(
                onTap: (){Get.bottomSheet(
  isDismissible: true,
  newchat(),
  isScrollControlled: true,
  barrierColor: const Color.fromARGB(235, 193, 190, 190), 
);},
                 child: Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: Colors.black45,
                    ),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Chat",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Send a message to your contact",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black38),
                        )
                      ],
                    )
                  ],
                               ),
               ),
              const SizedBox(height: 14,),
              Divider(
                color: Colors.blueGrey.shade50,
                height: 1,
              ),
              const SizedBox(height: 14,),
              GestureDetector(
                  onTap: (){},
                child: const Row(
                  children: [
                    Icon(
                      Icons.perm_contact_cal_outlined,
                      color: Colors.black45,
                    ),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Contact",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Add a contact to be able to send messages",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black38),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 14,),
              Divider(
                color: Colors.blueGrey.shade50,
                height: 1,
              ),
              const SizedBox(height: 14,),
               GestureDetector(
                  onTap: (){
                  },
                 child: Row(
                  children: [
                    Icon(
                      Icons.people_outlined,
                      color: Colors.black45,
                    ),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "New Community",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Join the community around you",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black38),
                        )
                      ],
                    )
                  ],
                               ),
               ),
    
            ],
          ),
        ),
      ),
    );
  }
}
