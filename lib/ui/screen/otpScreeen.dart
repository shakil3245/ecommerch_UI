import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:craftybay/ui/screen/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/elevetedButton.dart';
import 'package:get/get.dart';
import 'completeProfile.dart';

class OTPscreen extends StatelessWidget {
  const OTPscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Text("Enter OTP Code", style: titleStyle),
            SizedBox(
              height: 10,
            ),
            Text(
              "A 4 Digit OTP Code has been sent",
              style: TextStyle(fontSize: 15, color: grayColor),
            ),
            SizedBox(
              height: 16,
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              keyboardType: TextInputType.number,
              length: 4,
              controller: TextEditingController(),
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 45,
                activeFillColor: Colors.white,
                activeColor: primaryColor,
                selectedColor: primaryColor,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                inactiveColor: primaryColor,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (v) {},
              onChanged: (value) {},
              appContext: context,
            ),
            SizedBox(height: 15,),
            elevetedButton(Title: 'Next', onTap: () { Get.to(CompleteProfile()); },),
            SizedBox(height: 30,),
            RichText(
                text: TextSpan(
                    text: "This code will expire in",
                    style: TextStyle(color: grayColor, fontSize: 12),
                    children: [
                  TextSpan(
                      text: "120s",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold))
                ])),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Resent Code",
                  style: TextStyle(color: grayColor.withOpacity(0.5)),
                ))
          ],
        ),
      ),
    );
  }
}
