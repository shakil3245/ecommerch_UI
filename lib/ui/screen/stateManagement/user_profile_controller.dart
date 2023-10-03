import 'package:craftybay/data/models/profile_Model.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:craftybay/ui/screen/completeProfile.dart';
import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:get/get.dart';

import '../../../data/service/network_api.dart';

class userProfileController extends GetxController{
  bool _UserProfileDataInProgress = true;

  AuthController _authController = Get.put(AuthController());
  Future<bool> getUserData() async {
    _UserProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'ReadProfile');
    _UserProfileDataInProgress = false;
    if (response.isSuccess) {
      final profileModel Profile_M0del = profileModel.fromJson(response.returnData);
      if(Profile_M0del.data != null) {
        _authController.saveProfileData(Profile_M0del.data!);
      }else{
        Get.to(CompleteProfile());

      }
      update();
      return true;
      
    } else {
      update();
      return false;
    }
  }
}