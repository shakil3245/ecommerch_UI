import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:get/get.dart';

import '../../../data/models/reviewModel.dart';
import '../../../data/service/network_api.dart';

class ReviewController extends GetxController{
  bool _getReviewInProgress = false;
  bool get getWishListInProgress => _getReviewInProgress;
  ReviewModel _allReviewList = ReviewModel();
  ReviewModel get allReviewList => _allReviewList;

  AuthController _authController = Get.put(AuthController());

  Future<bool> reviewList(int productId) async {
    _getReviewInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'ListReviewByProduct/$productId');
    _getReviewInProgress = false;
    if (response.isSuccess) {
      _allReviewList = ReviewModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      if (response.statusCode == 401) {
        _authController.LogOut();
      }
      update();
      return false;
    }
  }
}