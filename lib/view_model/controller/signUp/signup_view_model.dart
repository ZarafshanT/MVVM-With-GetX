import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class SignupViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static SignupViewModel get instance => Get.find();
  SharedPreferences? _prefs; // Declare SharedPreferences instance

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //var obscureConfirmPassword = true.obs;

  RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    print('isPasswordVisible: ${isPasswordVisible.value}');
  }

  RxBool isConfirmPasswordVisible = false.obs;

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Add this for password confirmation
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode =
      FocusNode(); // Add this for password confirmation

  RxBool loading = false.obs;

  // Initialize SharedPreferences within an asynchronous function
  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Constructor for SignupViewModel
  SignupViewModel() {
    // Call the initialization function when creating an instance of SignupViewModel
    initSharedPreferences();
  }

  Future<void> signup(email, password) async {
    loading.value = true;

    try {
      if (passwordController.value.text !=
          confirmPasswordController.value.text) {
        Utils.snackBar('Signup', 'Passwords do not match');
        return;
      }

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.value.toString(),
        password: passwordController.value.toString(),
      );

      final User? user = userCredential.user;

      if (user != null) {
        // Store user-related data in SharedPreferences
        _prefs?.setBool('isLoggedIn', true);
        _prefs?.setString('userId', user.uid);

        // Signup successful
        Utils.snackBar('Signup', 'Signup successful');
        // Navigate to your home view or perform any other desired actions.
        // Example: Get.offNamed(RoutesName.homeView);
        Get.offNamed(RoutesName.homeView);
      } else {
        Utils.snackBar('Signup', 'User registration failed');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      Utils.snackBar('Error', e.toString());
    } finally {
      loading.value = false;
    }
  }
}
