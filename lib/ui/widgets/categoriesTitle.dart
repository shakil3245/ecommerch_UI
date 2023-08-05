import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class CategoriesTitle extends StatelessWidget {
  final String CatTitle;
  final VoidCallback Ontap;

  const CategoriesTitle({super.key, required this.CatTitle, required this.Ontap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(CatTitle,style: TextStyle(color: grayColor.withOpacity(0.90),fontSize: 20,fontWeight: FontWeight.w600),),
        InkWell(
            onTap: Ontap,
            child: Text("See All",style: TextStyle(color: primaryColor,fontSize: 15),))

      ],);
  }
}
