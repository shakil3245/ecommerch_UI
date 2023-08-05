import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/AppBarIconButton.dart';
import '../../widgets/caroselSlider.dart';
import '../../widgets/categoriesTitle.dart';
import '../../widgets/categorycard.dart';
import '../../widgets/dotIndicator.dart';
import '../../widgets/porductCard.dart';
import '../../widgets/searchBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<int> _carrentindex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/img/logo_nav.png"),
            Spacer(),
            appBarIconButtton(iconData: Icons.person,onTap: (){},),
            appBarIconButtton(iconData: Icons.call,onTap: (){},),
            appBarIconButtton(iconData: Icons.notification_important,onTap: (){},),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            productSearchBar(),
            SizedBox(height: 16,),
            caroselSlider(),
            SizedBox(height: 10,),
            CategoriesTitle(CatTitle: 'All Categories',Ontap: (){},),
            SizedBox(height: 10,),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(children: [
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
               categoryCard(catTitle: 'Electronics', icondata: Icons.computer_rounded,),
             ],),
           ),
            SizedBox(height: 15,),
            CategoriesTitle(CatTitle: 'Popular',Ontap: (){},),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                productcard(),
                productcard(),
                productcard(),
                productcard(),
                productcard(),
              ],),
            ),
            SizedBox(height: 15,),
            CategoriesTitle(CatTitle: 'Special',Ontap: (){},),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                productcard(),
                productcard(),
                productcard(),
                productcard(),
                productcard(),
              ],),
            ),
            SizedBox(height: 15,),
            CategoriesTitle(CatTitle: 'New',Ontap: (){},),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                productcard(),
                productcard(),
                productcard(),
                productcard(),
                productcard(),
              ],),
            )
          ],),
        ),
      ),
    );
  }
}
