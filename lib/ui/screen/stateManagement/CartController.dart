import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:get/get.dart';

import '../../../data/models/CartListModel.dart';
import '../../../data/models/cartModel.dart';
import '../../../data/service/network_api.dart';
class CartController extends GetxController{
  bool _getAddToCardInProgree = false;
  bool get getWishListInProgree => _getAddToCardInProgree;
  AuthController _authController = Get.put(AuthController());

  bool _getCartListInProgress = false;
  bool get getCartListInProgress => _getCartListInProgress;

  CartListModel _cartListModel = CartListModel();
  CartListModel get cartListModel => _cartListModel;

  Future<bool> addToCardlist( int productId, String productColor, String productSize) async {
    _getAddToCardInProgree = true;
    update();
    final response = await NetworkCaller.postRequest(url: "CreateCartList",body: {
      "product_id":productId,
      "color":productColor,
      "size":productSize
    });
    _getAddToCardInProgree = false;
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

  Future<bool> getCartList() async {
    _getCartListInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'CartList');
    _getCartListInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.returnData);
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