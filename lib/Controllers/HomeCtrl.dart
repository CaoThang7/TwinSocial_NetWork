import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';

class HomeController extends GetxController {
  RxString? access_token;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    var scopedToken = await NetworkHandler.getToken("access_token");
    if (scopedToken != null) {
      access_token?.value = scopedToken;
      var response = await NetworkHandler.get("getProfile", scopedToken);
      print("userProfile: $response");
      // print(scopedToken);
      await Future.delayed(Duration(milliseconds: 3000), () {});
      Get.toNamed("/homeScreen");
    } else {
      await Future.delayed(Duration(milliseconds: 3000), () {});
      Get.toNamed("/loginScreen");
    }
  }
}
