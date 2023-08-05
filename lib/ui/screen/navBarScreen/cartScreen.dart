
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/elevetedButton.dart';
import '../../widgets/stepper_product.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        elevation: 0.7,
      ),
      body:Column(children: [
        Expanded(child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            child: Card(child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 80,height: 100,
                  child: Image.network("https://static-01.daraz.com.bd/p/131fa2f56ce15033bbc1236ea0763cba.jpg",fit: BoxFit.fill,),),
              ),
              SizedBox(width: 16,),
              Column(children: [
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Year special shoe",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Text("Color : Red, Size: X",style: TextStyle(fontSize: 12),),
                    ],),
                  SizedBox(width:50 ,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("\$100",style: TextStyle(fontSize: 18,color: primaryColor),),
                    SizedBox(width: 100,),
                    ProductStepper(),
                  ],)
              ],)

            ],),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            child: Card(child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 80,height: 100,
                  child: Image.network("https://static-01.daraz.com.bd/p/131fa2f56ce15033bbc1236ea0763cba.jpg",fit: BoxFit.fill,),),
              ),
              SizedBox(width: 16,),
              Column(children: [
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Year special shoe",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Text("Color : Red, Size: X",style: TextStyle(fontSize: 12),),
                    ],),
                  SizedBox(width:50 ,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("\$100",style: TextStyle(fontSize: 18,color: primaryColor),),
                    SizedBox(width: 100,),
                    ProductStepper(),
                  ],)
              ],)

            ],),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            child: Card(child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 80,height: 100,
                  child: Image.network("https://static-01.daraz.com.bd/p/131fa2f56ce15033bbc1236ea0763cba.jpg",fit: BoxFit.fill,),),
              ),
              SizedBox(width: 16,),
              Column(children: [
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Year special shoe",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Text("Color : Red, Size: X",style: TextStyle(fontSize: 12),),
                    ],),
                  SizedBox(width:50 ,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("\$100",style: TextStyle(fontSize: 18,color: primaryColor),),
                    SizedBox(width: 100,),
                    ProductStepper(),
                  ],)
              ],)

            ],),),
          ),
        ],)),
        Container(
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    Text("\$100",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor),),
                  ],
                ),
                SizedBox(
                    width: 120,
                    child: elevetedButton(Title: 'Add to card', onTap: () {},)),
              ],
            ),
          ),
        )

      ],) ,
    );
  }
}
