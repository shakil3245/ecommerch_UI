import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_review_page.dart';
class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reviews",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        elevation: 0.7,
      ),
      body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(children: [
                Card(child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          radius: 12,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 5,),
                        Text("Shakil Ahmed",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                      ],),
                      SizedBox(height: 8,),
                      Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.7)),),
                    ],),
                ),),
                Card(child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          radius: 12,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 5,),
                        Text("Shakil Ahmed",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                      ],),
                      SizedBox(height: 8,),
                      Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.7)),),
                    ],),
                ),),
                Card(child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          radius: 12,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 5,),
                        Text("Shakil Ahmed",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                      ],),
                      SizedBox(height: 8,),
                      Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.7)),),
                    ],),
                ),),
                Card(child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          radius: 12,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 5,),
                        Text("Shakil Ahmed",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                      ],),
                      SizedBox(height: 8,),
                      Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.7)),),
                    ],),
                ),),
              ],),
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              color: primaryColor.withOpacity(0.2)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                Text("Reviews",style: TextStyle(fontSize: 15),),
                SizedBox(width: 8,),
                Text("(1000)"),
                Spacer(),
                   SizedBox(
                      height: 45,
                      width: 45,
                      child: FloatingActionButton(
                        backgroundColor: primaryColor,
                        onPressed: (){
                          Get.to(CreateReviewPage());
                        },child: Icon(Icons.add),),),

              ],),
            ),
          )

        ],),
    );
  }
}
