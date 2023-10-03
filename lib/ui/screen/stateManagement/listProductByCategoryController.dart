import 'package:craftybay/data/service/network_api.dart';
import 'package:get/get.dart';

import '../../../data/models/productByCategoryModel.dart';

class ListProductByCategoryController extends GetxController {
  bool _ListProductbyCategoryInProgress = false;
  bool get listProductbyCategoryInProgress => _ListProductbyCategoryInProgress;

  ProductByRemarkModel _ListProductByCategory = ProductByRemarkModel();
  ProductByRemarkModel get listProductByCategoryModel => _ListProductByCategory;

  Future<bool> getListProductByCategory(int CategoryID) async {
    _ListProductbyCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(
        url: "ListProductByCategory/$CategoryID");
    _ListProductbyCategoryInProgress = false;
    if (response.isSuccess) {
      _ListProductByCategory =
          ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return true;
    }
  }
}
