


import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/constants/colors/app_colors.dart';
import '../../../res/routes/routes_name.dart';

// class LoginViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences? _prefs; // Declare SharedPreferences instance


//   // Initialize SharedPreferences within an asynchronous function
//   Future<void> initSharedPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   // Constructor for LoginViewModel
//   LoginViewModel() {
//     // Call the initialization function when creating an instance of LoginViewModel
//     initSharedPreferences();
//   }

//   Future<void> login() async {
//     loading.value = true;

//     try {
//       final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: emailController.value.toString(),
//         password: passwordController.value.toString(),
//       );

//       final User? user = userCredential.user;

//       if (user != null) {
//         // Store user-related data in SharedPreferences
//         _prefs?.setBool('isLoggedIn', true);
//         _prefs?.setString('userId', user.uid);

//         // Login successful
//         Utils.snackBar('Login', 'Login successful');
//         // Navigate to your home view or perform any other desired actions.
//         // Example: Get.offNamed(RoutesName.homeView);
//           Get.offNamed(RoutesName.homeView);
//       } else {
//         Utils.snackBar('Login', 'User not found');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//       Utils.snackBar('Error', e.toString());
//     } finally {
//       loading.value = false;
//     }
//   }
// }




class LoginViewModel extends GetxController{

  final _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

 

  login(String email, String password) async{

    if(email != "" && password != "")
      {
        isLoading.value = true;
        final pref = await SharedPreferences.getInstance();
        _auth.signInWithEmailAndPassword(email: email, password: password)
            .then((value){
          isLoading.value = false;
          Get.snackbar("Congrats! $email", "You have logged in successfully!",backgroundColor: greenColor, colorText: whiteColor);
          pref.setString("email", email);
          pref.setString("uid", _auth.currentUser!.uid);
           Get.offNamed(RoutesName.homeView);
          
        }).catchError((error){
          Get.snackbar("Oops!", error.toString(),backgroundColor: redColor, colorText: whiteColor);
          isLoading.value = false;
        });
      }
    else{
      isLoading.value = false;
      Get.snackbar("All fields are required", 'Please fill all the fields and try again!',backgroundColor: redColor, colorText: whiteColor);
    }
  }

  signOut() async{
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    _auth.signOut();
    Get.offAll(RoutesName.loginView,
    transition: Transition.leftToRightWithFade,
    duration: const Duration(seconds: 1));
  }

}