import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/elevetedButton.dart';
import '../widgets/textFormFiled.dart';
import 'otpScreeen.dart';
import 'utils/style.dart';

class EmailVarificationScreen extends StatelessWidget {
  const EmailVarificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/logo.png",
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Welcome Back", style: titleStyle),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please Enter Your Email Address",
              style: TextStyle(fontSize: 15, color: grayColor),
            ),
            SizedBox(
              height: 16,
            ),
            textFormFiled(
              hintText: "Email Address",
              controller: TextEditingController(),
              validator: (String? value) {}, textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            elevetedButton(
              Title: 'Next',
              onTap: () {
                Get.to(OTPscreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
