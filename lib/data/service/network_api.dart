import 'dart:convert';
import 'dart:developer';

import 'package:craftybay/data/utils/urls.dart';
import 'package:http/http.dart';
import '../../ui/screen/stateManagement/authcontroller.dart';
import '../models/response_model.dart';

class NetworkCaller {
  //cant create instants from other class
  NetworkCaller._();

//this function take a url that conctinate with baseurl
  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response =
          await get(Uri.parse(Urls.baseUrl + url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'token': AuthController.token.toString(),
      });
      log(response.body);

      if (response.statusCode == 200) {
        return ResponseModel(
          isSuccess: true,
          statusCode: response.statusCode,
          returnData: jsonDecode(response.body),
        );
      } else {
        return ResponseModel(
          isSuccess: false,
          statusCode: response.statusCode,
          returnData: jsonDecode(response.body),
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        isSuccess: false,
        statusCode: -1,
        returnData: e.toString(),
      );
    }
  }
// post request methos

  static Future<ResponseModel> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      print(AuthController.token.toString());
      print(body);
      final Response response = await post(Uri.parse(Urls.baseUrl + url),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'token': AuthController.token.toString(),
          },
          body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          isSuccess: false, statusCode: -1, returnData: e.toString());
    }
  }
}
