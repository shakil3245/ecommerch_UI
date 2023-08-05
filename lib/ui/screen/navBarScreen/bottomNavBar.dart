import 'package:craftybay/ui/screen/navBarScreen/CategoriesScreen.dart';
import 'package:craftybay/ui/screen/navBarScreen/WishScreen.dart';
import 'package:craftybay/ui/screen/navBarScreen/cartScreen.dart';
import 'package:craftybay/ui/screen/navBarScreen/homeScreen.dart';
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../stateManagement/bottomNavigationbarController.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BottomNavigationBarController _bottomNavigationBarController = Get.put(BottomNavigationBarController());

  List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder<BottomNavigationBarController>(
        builder: (context){
          return  _screens[context.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (context){
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 4,
            currentIndex: context.selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: grayColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard_rounded),label: "Wish"),
            ],
            onTap: (value){
              context.chnageindex(value);
            },
          );
        },
      )
    );
  }
}
