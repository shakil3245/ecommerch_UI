import 'package:craftybay/ui/screen/emailVarificationScreen.dart';
import 'package:craftybay/ui/screen/stateManagement/homeController.dart';
import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/material.dart';
import '../../widgets/AppBarIconButton.dart';
import '../../widgets/caroselSlider.dart';
import '../../widgets/catagoryCard_2.dart';
import '../../widgets/categoriesTitle.dart';
import '../../widgets/porductCardforCart.dart';
import '../../widgets/productCardsForAll.dart';
import '../../widgets/searchBar.dart';
import 'package:get/get.dart';

import '../stateManagement/categoryController.dart';
import '../stateManagement/productByRemarkController.dart';
import 'CategoriesScreen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController _authController = Get.put(AuthController());
  HomeController _homeController = Get.put(HomeController());
  CategoryController _categoryModel = Get.put(CategoryController());
  ProductByRemarkController _productByRemarkController = Get.put(ProductByRemarkController());

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
            appBarIconButtton(
              iconData: Icons.person,
              onTap: () {
                _authController.isLoggedIn().then((value) {
                  if (value) {
                    Get.to(profileScreen());
                  } else {
                    Get.to(EmailVerificationScreen());
                  }
                });
              },
            ),
            appBarIconButtton(
              iconData: Icons.call,
              onTap: () {},
            ),
            appBarIconButtton(
              iconData: Icons.notification_important,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              productSearchBar(),
              SizedBox(
                height: 16,
              ),
              GetBuilder<HomeController>(builder: (homeController) {
                if (homeController.getSliderDataInProgress) {
                  return SizedBox(height: 175,
                    child: Center(child: CircularProgressIndicator(color: primaryColor,),),);
                } else {
                  return caroselSlider(
                    sliderDataModel: homeController.sliderDataModel,
                  );
                }
              }),
              SizedBox(
                height: 10,
              ),
              CategoriesTitle(
                CatTitle: 'All Categories',
                Ontap: () {
                  Get.to(CategoriesScreen());
                },
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<CategoryController>(
                builder: (categoryController) {
                  if(categoryController.getCategoryInProgress){
                    return SizedBox(height: 90,
                    child: Center(child: CircularProgressIndicator(color: primaryColor,),),);
                  }else{
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categoryController.categoryModel.category!.map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: categoryCard2(
                            catTitle: e.categoryName.toString(),
                            imageUrl: e.categoryImg.toString(), id: e.id ?? 0,
                          ),
                        ),).toList()
                      ),
                    );
                  }

                }
              ),
              SizedBox(
                height: 15,
              ),
              CategoriesTitle(
                CatTitle: 'Popular',
                Ontap: () {},
              ),
              GetBuilder<ProductByRemarkController>(
                builder: (productBypopularRemark) {
                  if(productBypopularRemark.PopularProductInProgress){
                    return SizedBox(height: 90,
                      child: Center(child: CircularProgressIndicator(color: primaryColor,),),);
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: productBypopularRemark.productBySpecial.products!.map((product) =>ProductCard( product: product) ).toList()

                    ),
                  );
                }
              ),
              SizedBox(
                height: 15,
              ),
              CategoriesTitle(
                CatTitle: 'Special',
                Ontap: () {},
              ),
              GetBuilder<ProductByRemarkController>(
                builder: (productBtSpecialRemark) {
                  if(productBtSpecialRemark.specialProductInProgress){
                    return SizedBox(height: 90,
                      child: Center(child: CircularProgressIndicator(color: primaryColor,),),);
                  }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: productBtSpecialRemark.productBySpecial.products!.map((productSpecial) => ProductCard( product: productSpecial,)).toList(),
                      ),
                    );
                  }
              ),
              SizedBox(
                height: 15,
              ),
              CategoriesTitle(
                CatTitle: 'New',
                Ontap: () {
                },
              ),
              GetBuilder<ProductByRemarkController>(
                  builder: (productByNewRemark) {
                    if(productByNewRemark.newProductInProgress){
                      return SizedBox(height: 90,
                        child: Center(child: CircularProgressIndicator(color: primaryColor,),),);
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:productByNewRemark.productByNew.products!.map((productNew) => ProductCard(product: productNew,)).toList(),
                      ),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
