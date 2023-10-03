import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:get/get.dart';

import '../../../data/service/network_api.dart';

class WishListControllers extends GetxController{
  bool _getWishListInProgree = false;
  bool get getWishListInProgree => _getWishListInProgree;
  AuthController _authController = Get.put(AuthController());

  Future<bool> addToWishlist(int productId) async {
    _getWishListInProgree = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'CreateWishList/$productId');
    _getWishListInProgree = false;
    if (response.isSuccess) {
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