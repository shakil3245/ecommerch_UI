import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class categoryCard extends StatelessWidget {
final String catTitle;
final IconData icondata;

  const categoryCard({super.key, required this.catTitle, required this.icondata});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 65,
        width: 65,
        decoration:BoxDecoration(
          color: primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ) ,
        child: Icon(icondata,size: 40,color: primaryColor,),
      ),
      SizedBox(height: 4,),
      Text(catTitle,style: TextStyle(fontSize: 14,color: primaryColor),),
    ],);
  }
}
