import 'package:get/get.dart';
import '../../../data/models/categoryModel.dart';
import '../../../data/service/network_api.dart';

class CategoryController extends GetxController {
  CategoryModel _categoryModel = CategoryModel();
  bool _getCategoryInProgress = false;

  bool get getCategoryInProgress => _getCategoryInProgress;

  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategories() async {
    _getCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'CategoryList');
    _getCategoryInProgress = false;
    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}