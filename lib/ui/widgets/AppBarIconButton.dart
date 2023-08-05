import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/material.dart';

class appBarIconButtton extends StatelessWidget {

  final IconData iconData;
  final VoidCallback onTap;

  const appBarIconButtton({super.key, required this.iconData, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: CircleAvatar(
          radius: 15,
          child: Icon(iconData,color: grayColor,size: 18,),
          backgroundColor: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}