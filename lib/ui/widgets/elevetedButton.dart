import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class elevetedButton extends StatelessWidget {
  final String Title;
  final VoidCallback onTap;

  const elevetedButton({super.key, required this.Title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: onTap,
          child: Text(
            Title,
            style: TextStyle(fontSize: 15),
          )),
    );
  }
}
