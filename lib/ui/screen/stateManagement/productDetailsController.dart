import 'package:get/get.dart';

import '../../../data/models/categoryModel.dart';
import '../../../data/models/productDetailsModel.dart';
import '../../../data/service/network_api.dart';

class ProductDetailController extends GetxController {
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();
  bool _getProductDetailInProgress = false;

  bool get getCategoryInProgress => _getProductDetailInProgress;
  ProductDetailsModel get productDetailModel => _productDetailsModel;

  Future<bool> getProductDetails(int productID) async {
    _getProductDetailInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'ProductDetailsById/$productID');
    _getProductDetailInProgress = false;
    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}