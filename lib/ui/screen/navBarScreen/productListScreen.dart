import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/productCardsForAll.dart';
import '../stateManagement/listProductByCategoryController.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;

  const ProductListScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ListProductByCategoryController _listProductByCategoryController = Get.put(ListProductByCategoryController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {_listProductByCategoryController.getListProductByCategory(widget.categoryId);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: GetBuilder<ListProductByCategoryController>(builder: (productController) {
        if (productController.listProductbyCategoryInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.75),
          itemCount:
          productController.listProductByCategoryModel.products?.length ?? 0,
          itemBuilder: (context, index) {
            return ProductCard(product: productController.listProductByCategoryModel.products![index],
           
            );
          },
        );
      }),
    );
  }
}