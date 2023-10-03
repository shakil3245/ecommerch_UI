import 'package:craftybay/ui/screen/stateManagement/bottomNavigationbarController.dart';
import 'package:craftybay/ui/widgets/porductCardforCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/catagoryCard_2.dart';
import '../../widgets/categorycard.dart';
import '../stateManagement/categoryController.dart';
import '../utils/appColor.dart';
import 'productListScreen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final BottomNavigationBarController _bottomNavigationBarController =
      Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(
          onPressed: () {
            _bottomNavigationBarController.backHome();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: const Text(
          "Categories",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CategoryController>(builder: (categoryController) {
          if(categoryController.getCategoryInProgress){
            return const Center(child: Center(child: CircularProgressIndicator(),),);
          }else{
            return RefreshIndicator(
              onRefresh: ()async{
                Get.find<CategoryController>().getCategories();
              },
              child: GridView.builder(
                itemCount: categoryController.categoryModel.category?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  final catagory =
                  categoryController.categoryModel.category![index];
                  return categoryCard2(
                    catTitle: catagory.categoryName.toString(),
                    imageUrl: catagory.categoryImg.toString(), id: catagory.id!,
                  );
                },
              ),
            );
          }

        }),
      ),
    );
  }
}
