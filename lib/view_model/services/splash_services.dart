import 'dart:async';

import 'package:flutter_getx/res/routes/routes_name.dart';
import 'package:flutter_getx/view_model/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';

 // Import your UserPreferences

class SplashServices {
  void isLogin() {
    UserPreferences.getUser().then((user) {
      Timer(const Duration(seconds: 3), () {
        if (user == null || user.uid == null) {
          Get.toNamed(RoutesName.loginView);
        } else {
          Get.toNamed(RoutesName.homeView);
        }
      });
    });
  }
}
