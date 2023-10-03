import 'package:craftybay/data/service/network_api.dart';
import 'package:get/get.dart';

import '../../../data/models/sliderModel.dart';

class HomeController extends GetxController {
  bool _getSliderDataInProgress = false;
  bool get getSliderDataInProgress => _getSliderDataInProgress;

  SliderDataModel _sliderDataModel = SliderDataModel();
  SliderDataModel get sliderDataModel => _sliderDataModel;

  Future<bool> getHomeSliderData() async {
    _getSliderDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: "ListProductSlider");
    _getSliderDataInProgress = false;
    if (response.isSuccess) {
      _sliderDataModel = SliderDataModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return true;
    }
  }
}
