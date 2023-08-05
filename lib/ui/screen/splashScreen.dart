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
    Future.delayed(Duration(seconds: 2)).then((value) =>
    Get.off(BottomNavBar()),
    );
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
