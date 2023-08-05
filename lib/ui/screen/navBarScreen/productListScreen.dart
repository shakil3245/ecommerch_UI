import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/porductCard.dart';

class ProdeuctListScreen extends StatelessWidget {
  const ProdeuctListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        title: Text("Products"),
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
      ), itemBuilder: (context,index){
        return const productcard();
      }),
    );
  }
}
