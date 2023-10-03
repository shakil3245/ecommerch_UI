import 'package:craftybay/ui/screen/stateManagement/user_auth_controller.dart';
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/service/network_api.dart';
import '../widgets/elevetedButton.dart';
import '../widgets/textFormFiled.dart';
import 'otpScreeen.dart';
import 'utils/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailETController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  //getRequest method
 bool  _emailVerificationInProgress = false;
  Future<bool> emailVerification(String email) async {
    _emailVerificationInProgress = true;
    setState(() {

    });
    final response = await NetworkCaller.getRequest(url: 'UserLogin/$email');
    _emailVerificationInProgress = false;
    if (response.isSuccess) {
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
      body: Padding(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Welcome Back", style: titleStyle),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Please Enter Your Email Address",
                    style: TextStyle(fontSize: 15, color: grayColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  textFormFiled(
                    hintText: "Email Address",
                    controller: _emailETController,
                    textInputType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _emailVerificationInProgress? CircularProgressIndicator() :elevetedButton(
                          Title: 'Next',
                          onTap: ()   async {
                            if(_formKey.currentState!.validate()){
                              final bool response = await emailVerification(_emailETController.text);
                              if (response) {
                                Get.to(() => OTPscreen(email: _emailETController.text,));
                              } else {
                                if(mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Email verification Failds. Please try Again!")));
                                }
                              }
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
    );
  }
}
