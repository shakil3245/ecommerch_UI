import 'package:craftybay/ui/screen/stateManagement/bottomNavigationbarController.dart';
import 'package:craftybay/ui/widgets/porductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/categorycard.dart';
import '../utils/appColor.dart';
import 'productListScreen.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
 BottomNavigationBarController _bottomNavigationBarController = Get.put(BottomNavigationBarController());

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(
          onPressed: (){
              _bottomNavigationBarController.backHome();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,),
        title: Text(
          "Categories",),
      ),
      body: InkWell(
        onTap: (){
          Get.to(ProdeuctListScreen());
        },
        child: Padding (
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 40,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
          ),
              itemBuilder: (context,index){
            return categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,);
              },
          ),
        ),
      ),
    );
  }
}
