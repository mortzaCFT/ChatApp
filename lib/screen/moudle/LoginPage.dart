import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/InputController.dart';

class LoginPage extends StatelessWidget {
  final Inputcontroller _inputcontroller = Get.put(Inputcontroller());
  final TextEditingController _walletAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Colors.black.withOpacity(0.05)),
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Colors.black.withOpacity(0.05)),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: Icon(Icons.more_horiz_rounded),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Let's join with us",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Welcome to non server side chat app!",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            Text(
              "As we said we dont collect any infromation about you!",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            Text(
              "No mobile number,no email,no builshits.",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            Text(
              "We are here for you!",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                          width: 2, color: Colors.black.withOpacity(0.05)),
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Wallet",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Colors.black.withOpacity(0.05)),
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Colors.black.withOpacity(0.05)),
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Social",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Wallet address",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      _inputcontroller.checkWalletAddress(text);
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 300,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 380,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 2,
                          color: _inputcontroller.isWalletAddressValid
                              ? Colors.black.withOpacity(0.05)
                              : Colors.red,
                        ),
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
                          _inputcontroller.checkWalletAddress(text);
                        },
                      ),
                    ),
                    if (!_inputcontroller.isWalletAddressValid)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Please enter a valid wallet address.',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                );
              })
            ]),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
