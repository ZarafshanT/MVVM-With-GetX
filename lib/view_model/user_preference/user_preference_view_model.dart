import 'package:flutter_getx/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/constants/shared_Preferences_constants.dart';



class UserPreferences {


  static Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kUidKey, user.uid ?? '');
    prefs.setString(kEmailKey, user.email ?? '');
   
    prefs.setString(kNameKey, user.name ?? '');
    prefs.setString(kPhoneNumberKey, user.phoneNumber ?? '');
  }

  static Future<UserModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final uid = prefs.getString(kUidKey) ?? '';
    final email = prefs.getString(kEmailKey) ?? '';
   
    final name = prefs.getString(kNameKey) ?? '';
    final phoneNumber = prefs.getString(kPhoneNumberKey) ?? '';

    return UserModel(
      uid: uid,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
    );
  }

  static Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
