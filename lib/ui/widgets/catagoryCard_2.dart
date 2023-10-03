import 'package:craftybay/ui/screen/navBarScreen/productListScreen.dart';
import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';
import 'package:get/get.dart';

class categoryCard2 extends StatelessWidget {
  final String catTitle;
  final String imageUrl;
  final int id;

  const categoryCard2(
      {super.key,
      required this.catTitle,
      required this.imageUrl,
      required this.id});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(ProductListScreen( categoryId: id,));
          },
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.network(
              imageUrl,
              height: 50,
              width: 50,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          catTitle,
          style: TextStyle(fontSize: 14, color: primaryColor),
        ),
      ],
    );
  }
}
