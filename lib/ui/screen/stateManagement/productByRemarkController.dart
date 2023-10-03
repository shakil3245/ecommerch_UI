import 'package:craftybay/data/service/network_api.dart';
import 'package:get/get.dart';

import '../../../data/models/productByCategoryModel.dart';

class ProductByRemarkController extends GetxController{
  bool _PopularProductInProgress = false;
  bool _SpecialProductInProgress = false;
  bool _NewProductInProgress = false;

  bool get PopularProductInProgress => _PopularProductInProgress;
  bool get specialProductInProgress => _SpecialProductInProgress;
  bool get newProductInProgress => _NewProductInProgress;

  ProductByRemarkModel _productByPopular = ProductByRemarkModel();
  ProductByRemarkModel _productBySpecial = ProductByRemarkModel();
  ProductByRemarkModel _productByNew = ProductByRemarkModel();

  ProductByRemarkModel get productByPopular =>_productByPopular;
  ProductByRemarkModel get productBySpecial =>_productBySpecial;
  ProductByRemarkModel get productByNew =>_productByNew;

  Future<bool> getPopularProductByRemark()async{
    _PopularProductInProgress = true;
    update();
    
    final response = await NetworkCaller.getRequest(url: "ListProductByRemark/popular");
    _PopularProductInProgress = false;
    if(response.isSuccess){
      _productByPopular = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

  Future<bool> getSpecialProductByRemark()async{
    _SpecialProductInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: "ListProductByRemark/special");
    _SpecialProductInProgress = false;
    if(response.isSuccess){
      _productBySpecial = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

  Future<bool> getNewProductByRemark()async{
    _NewProductInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: "ListProductByRemark/new");
    _NewProductInProgress = false;
    if(response.isSuccess){
      _productByNew = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}