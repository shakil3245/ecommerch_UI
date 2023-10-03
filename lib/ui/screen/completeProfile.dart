import 'dart:developer';

import 'package:craftybay/ui/screen/navBarScreen/homeScreen.dart';
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:craftybay/ui/screen/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/service/network_api.dart';
import '../../data/utils/urls.dart';
import '../widgets/elevetedButton.dart';
import '../widgets/textFormFiled.dart';
import 'navBarScreen/bottomNavBar.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _emailVerificationInProgress = false;
    TextEditingController _F_nameETController = TextEditingController();
    TextEditingController _L_nameETController = TextEditingController();
    TextEditingController _mobileETController = TextEditingController();
    TextEditingController _cityETController = TextEditingController();
    TextEditingController _shippingAddressETController = TextEditingController();



  Future<bool> UserProfileData() async {
    _emailVerificationInProgress = true;
    setState(() {

    });
    final response = await NetworkCaller.postRequest(url: Urls.baseUrl + 'CreateProfile',
        body: {
        "firstName":_F_nameETController.text,
        "lastName":_L_nameETController.text,
        "mobile":_mobileETController.text,
        "city":_cityETController.text,
        "shippingAddress":_shippingAddressETController.text
        });
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/img/logo.png",
                  width: 80,
                  height: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Complete Profile", style: titleStyle),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Get Started with us with your details",
                  style: TextStyle(fontSize: 15, color: grayColor),
                ),
                SizedBox(
                  height: 16,
                ),
                textFormFiled(
                  hintText: 'First Name',
                  controller: _F_nameETController,
                  validator: (String? value) {
                    if(value!.isEmpty?? true){
                      return 'Enter Your First Name';
                    }
                    return null;
                  },
                  textInputType: null,
                ),
                SizedBox(
                  height: 14,
                ),
                textFormFiled(
                  hintText: 'Last Name',
                  controller:_L_nameETController,
                  validator: (String? value) {
                    if(value!.isEmpty?? true){
                      return "Enter your Last  Name";
                    }
                    return null;
                  },
                  textInputType: null,
                ),
                SizedBox(
                  height: 14,
                ),
                textFormFiled(
                  hintText: 'Mobile',
                  controller: _mobileETController,
                  validator: (String? value) {
                    if(value!.isEmpty?? true){
                      return "Enter your Number";
                    }
                    return null;
                  },
                  textInputType: TextInputType.number,
                ),
                SizedBox(
                  height: 14,
                ),
                textFormFiled(
                  hintText: 'City',
                  controller: _cityETController,
                  validator: (String? value) {
                    if(value!.isEmpty?? true){
                      return "Enter your Number";
                    }
                    return null;
                  },
                  textInputType: null,
                ),
                SizedBox(
                  height: 14,
                ),
                TextFormField(
                  maxLines: 4,
                  controller: _shippingAddressETController,
                  validator: (String? value) {
                    if(value!.isEmpty?? true){
                      return "Enter your Number";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Shipping Address",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                _emailVerificationInProgress? CircularProgressIndicator() :elevetedButton(
                  Title: 'Complete',
                  onTap: () async {
                    if(_formKey.currentState!.validate()){
                      final bool response = await UserProfileData();
                      log(response.toString());
                      if (response) {
                        Get.to(() => HomeScreen());
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
      ),
    );
  }
}
