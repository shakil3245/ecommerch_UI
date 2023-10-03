
import 'package:get/get.dart';

import '../../../data/service/network_api.dart';
class CreateReviewController extends GetxController{
  bool _createReviewInProgress = false;
  bool get createReviewInProgress => _createReviewInProgress;
  //AuthController _authController = Get.put(AuthController());

  Future<bool> CreateReview( int productId, String productDes) async {
    _createReviewInProgress = true;
    update();
    final response = await NetworkCaller.postRequest(url: "CreateProductReview",body: {
      "description":productDes,
      "product_id":productId,
    });
    _createReviewInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      // if (response.statusCode == 401) {
      //   _authController.LogOut();
      // }
      update();
      return false;
    }
  }
}