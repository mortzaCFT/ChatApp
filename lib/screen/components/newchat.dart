
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chatapp/controllers/InputController.dart';

class newchat extends StatelessWidget {
  final Inputcontroller _loginController = Get.put(Inputcontroller());
  final TextEditingController _walletAddress = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey,width: 2)),
        borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40,0,40,0),
        child: Column(
          children:[ 
            SizedBox(height: 10,),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white24), height: 8, width: 120,),
             SizedBox(height: 30,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Starting new chat",style: TextStyle(fontSize: 20,color: Colors.black),),
              ],),
              SizedBox(height: 30,),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please Enter your friend wallet address to connect ",
                        style: TextStyle(
                          color: Colors.black38
                        ),
                      ),
                    ],
                  ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "easily trough testnet*, and make a ",
                        style: TextStyle(
                          color: Colors.black38
                        ),
                      ),
                    ],
                  ),

                                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "privicy based chat.",
                        style: TextStyle(
                          color: Colors.black38
                        ),
                      ),
                    ],
                  ),
               Container(
                  width: 380,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: Colors.transparent,
                    border: Border.all(
                        width: 2, color: Colors.black.withOpacity(0.05)),
                  ),
                  child: TextField(
                    controller: _walletAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: '0x..',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.2)),
                    ),
                    cursorColor: Colors.black.withOpacity(0.3),
                    onChanged: (text) {
                      _loginController.checkWalletAddress(text);
                    },
                  ),
                ),
              SizedBox(height: 500,),
    Obx(()=>ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 50),
                    elevation: 0,
                    backgroundColor: _loginController.isWalletAddressFilled
                        ? Colors.black
                        : Colors.black.withOpacity(0.09),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: _loginController.isWalletAddressFilled
                              ? Colors.white
                              : Colors.black.withOpacity(0.6),
                        ),
                      )
                    ],
                  ),
                onPressed: () {
  if (!_loginController.isWalletAddressFilled) {
  } else {
    _loginController.addChat(_walletAddress.text);
    Get.toNamed("/home");
  }
},

        )) 
            ]
        ),
      ),
    );
  }
}