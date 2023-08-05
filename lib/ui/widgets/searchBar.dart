import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class productSearchBar extends StatelessWidget {
  const productSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      keyboardType: TextInputType.text,
      textInputAction:TextInputAction.search,
      onSubmitted: (value){},
      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),

        fillColor: grayColor.withOpacity(0.085),
        prefixIcon: Icon(Icons.search),
        hintText: "Search...",
        filled: true,
      ),
    );
  }
}



