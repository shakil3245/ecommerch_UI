import 'package:craftybay/data/service/network_api.dart';
import 'package:get/get.dart';

import '../../../data/utils/urls.dart';
import 'authcontroller.dart';

class UserAuthController extends GetxController{
  bool _otpVerificationInProgress = false;
  bool _emailVerificationInProgress = false;

  bool get emailVerificationInProgress => _emailVerificationInProgress;
  bool get otpVerificationInProgress => _otpVerificationInProgress;

  Future<bool> emailVerification(String email) async {
    _emailVerificationInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/UserLogin/$email');
    _emailVerificationInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  Future<bool> otpVerification(String email,String otp) async {
    _otpVerificationInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'VerifyLogin/$email/$otp');
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      Get.find<AuthController>().saveToken(response.returnData['data']);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }





}