import 'package:flutter/material.dart';

import '../screen/navBarScreen/productDetailScreen.dart';
import '../screen/utils/appColor.dart';
import 'package:get/get.dart';


class productcard extends StatelessWidget {
  const productcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Get.to( ProductDetailScreen());
      },
      child: Card(
        elevation: 0.4,
        shadowColor: primaryColor,
        child: Column(children: [
          Container(
              height: 150,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvfmn1cgfuY4Nwr9sKfULt-a0DocDsbB-GPA&usqp=CAU",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("New Year special shoes 30",style: TextStyle(fontSize: 10),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('\$100',style: TextStyle(fontSize: 10,color: primaryColor),),
                          Row(children: [
                            Icon(Icons.star,size: 15,color: Colors.orange,),
                            Text("4.8",style: TextStyle(fontSize: 11),),
                          ],),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(Icons.favorite_border,color: Colors.white,size: 15,),
                          )
                        ],)
                    ],
                  ),
                )
              ],)
          ),
        ],),
      ),
    );
  }
}
