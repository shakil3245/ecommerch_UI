import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:craftybay/ui/screen/stateManagement/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/screen/splashScreen.dart';

void main() {
  runApp(CraftyBay());
}

class CraftyBay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),
          elevation:0,
        ),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class GetxBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(UserAuthController());

  }

}
