import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:craftybay/ui/screen/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/elevetedButton.dart';
import '../widgets/textFormFiled.dart';
import 'navBarScreen/bottomNavBar.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
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
              textFormFiled(hintText: 'First Name', controller: TextEditingController(), validator: (String ) {  }, textInputType: null,),
              SizedBox(height: 14,),
              textFormFiled(hintText: 'Last Name', controller: TextEditingController(), validator: (String ) {  }, textInputType: null,),
              SizedBox(height: 14,),
              textFormFiled(hintText: 'Mobile', controller: TextEditingController(), validator: (String ) {  }, textInputType: TextInputType.number,),
              SizedBox(height: 14,),
              textFormFiled(hintText: 'City', controller: TextEditingController(), validator: (String ) {  }, textInputType: null,),
              SizedBox(height: 14,),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: "Shipping Address",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  )

                ),
              ),
              SizedBox(height: 20,),
              elevetedButton(
                Title: 'Complete',
                onTap: () {
                  ;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
