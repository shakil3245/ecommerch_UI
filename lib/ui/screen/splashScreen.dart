import 'dart:developer';

import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'emailVarificationScreen.dart';
import 'navBarScreen/bottomNavBar.dart';
import 'utils/appColor.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value)  {
      Get.off(const BottomNavBar());
      /*final bool loginState = await Get.find<AuthController>().isLoggedIn();
      log(loginState.toString());
      if (loginState) {
        Get.off(const BottomNavBar());
      } else {
        Get.off(const EmailVerificationScreen());
      }*/
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
                child: Image.asset(
              "assets/img/logo.png",
              width: 120,
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Version 2.0",
                  style: TextStyle(
                      color: grayColor, fontSize: 12, letterSpacing: 0.6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
