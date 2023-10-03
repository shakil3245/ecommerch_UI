import 'dart:convert';
import 'dart:developer';

import 'package:craftybay/data/models/profile_Model.dart';
import 'package:craftybay/ui/screen/emailVarificationScreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/profile.dart';

class AuthController extends GetxController {
  static String? _token;
  static Profile? _profileData;

  static String? get token => _token;
  static Profile? get profile => _profileData;

  Future<void> saveToken(String userToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = userToken;
    log(_token.toString());
    await prefs.setString('crafty_token', userToken);
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('crafty_token');
  }

  Future<void> clrearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    //_token = null;
    log("token:" +_token.toString());
  }

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> saveProfileData(Profile profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _profileData = profile;
    await prefs.setString('User_Profile', profile.toJson().toString());
  }

  Future<void> getProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _profileData =
        Profile.fromJson(jsonDecode(prefs.getString('User_Profile') ?? "{}"));
  }

  Future<void> LogOut() async {
    await clrearUserData();
    Get.to(const EmailVerificationScreen());
  }


  Future<bool> checkAuthValidation() async {
    final authState = await isLoggedIn();
    if (authState == false) {
      Get.to(const EmailVerificationScreen());
    }
    return authState;
  }

}
