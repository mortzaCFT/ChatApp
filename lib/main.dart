import 'package:chatapp/screen/HomeScreen.dart';
import 'package:chatapp/screen/LoginScreen.dart';
import 'package:chatapp/screen/ProfileScreen.dart';
import 'package:chatapp/screen/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      getPages: [
        GetPage(name: "/home"   , page: () => HomeScreen()),
        GetPage(name: "/login"   , page: () => LoginScreen()),
        GetPage(name: "/profile", page:()=>   ProfileScreen()),
      ],
    );
  }
}