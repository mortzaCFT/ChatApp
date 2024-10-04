import 'package:chatapp/screen/moudle/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to RizeChat!",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Share with anyone ,anywhere."),
        ),
        Text("Sourcly, private, NO Server based.",style: TextStyle( color:Colors.black54)),
        Text("The blackchain chat app , You are welcome..",style: TextStyle( color:Colors.black54),),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,60,0,60),
          child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 50),
                    elevation: 0,
                    backgroundColor:  Color.fromARGB(255, 255, 213, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start Journey!",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    Get.to(LoginPage());
                  }
))
       ],
    ),
    );
  }
}

