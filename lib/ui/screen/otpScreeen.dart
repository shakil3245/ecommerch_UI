import 'dart:developer';
import 'package:craftybay/ui/screen/completeProfile.dart';
import 'package:craftybay/ui/screen/navBarScreen/homeScreen.dart';
import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:craftybay/ui/screen/stateManagement/user_profile_controller.dart';
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:craftybay/ui/screen/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/service/network_api.dart';
import '../widgets/elevetedButton.dart';
import 'package:get/get.dart';

class OTPscreen extends StatefulWidget {
   OTPscreen({Key? key , required this.email}) : super(key: key);

  final String email;

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  TextEditingController _otpETController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //otp verification fucntion

  bool _otpVerificationInProgress = false;

  AuthController _authController = Get.put(AuthController());
  userProfileController _userProfilecontroller = Get.put(userProfileController());


  Future<bool> otpVerification(String email,String otp) async {
    _otpVerificationInProgress = true;
    setState(() {

    });
    final response = await NetworkCaller.getRequest(url: 'VerifyLogin/$email/$otp');
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      _authController.saveToken(response.returnData['data']);
      _userProfilecontroller.getUserData();

      setState(() {

      });
      return true;
    } else {
     setState(() {

     });
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
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
                    controller: _otpETController,
                    obscureText: false,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter a valid otp';
                      }
                      return null;
                    },
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
                  _otpVerificationInProgress? CircularProgressIndicator():elevetedButton(Title: 'Next', onTap: () async {
                   if(_formKey.currentState!.validate()){
                     final bool response = await otpVerification(widget.email, _otpETController.text);
                     log(response.toString());
                     if(response){
                       Get.offAll(()=> HomeScreen());
                     }else{
                       Get.showSnackbar(GetSnackBar(title: 'otp verification failds',message: 'please try again',duration: Duration(seconds: 2),));
                     }
                   }
                  },),
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
                      onPressed: ()  {

                      },
                      child: Text(
                        "Resent Code",
                        style: TextStyle(color: grayColor.withOpacity(0.5)),
                      ))
                ],
              ),
            ),
          ),
    );
  }
}
