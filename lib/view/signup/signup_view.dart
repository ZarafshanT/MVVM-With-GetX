import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_getx/res/constants/extensions/sizedbox_extension.dart';
import 'package:flutter_getx/res/routes/routes_name.dart';
import 'package:flutter_getx/utils/utils.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/login/user_model.dart';
import '../../res/commom_widgets/common_button.dart';

import '../../res/commom_widgets/customTextFormFiled/textFormField.dart';
import '../../res/commom_widgets/text_widget/textStyle.dart';
import '../../view_model/controller/signUp/signup_view_model.dart';

class SignUp extends StatelessWidget {
  final SignupViewModel signupViewModel = Get.put(SignupViewModel());

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffFF9900)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              MyTextFormField(
                hintText: 'Enter Your Last Name',
                controller: signupViewModel.nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'First Name cannot be empty';
                  }
                  if (!RegExp('[a-zA-Z]').hasMatch(value)) {
                    return 'Please enter a valid last name';
                  }
                  return null;
                },
                onSaved: (value) {
                  // No need to set the value here, it's automatically saved
                  // in the controller by TextFormField.
                },
              ),
              10.sbh,
              MyTextFormField(
                  hintText: 'Enter Your Email',
                  controller: signupViewModel.emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid email';
                    }
                    if (!RegExp('[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // No need to set the value here.
                  }),
              12.sbh,
              MyTextFormField(
                hintText: 'Enter Your Password',
                controller: signupViewModel.passwordController,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required for login';
                  }
                  if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                    return 'Please enter a valid password (min 6 characters)';
                  }
                  return null;
                },
                onSaved: (value) {
                  // No need to set the value here.
                },
                onPressed: () {
                  signupViewModel.togglePasswordVisibility();
                },
              ),
              10.sbh,
              MyTextFormField(
                hintText: 'Enter confrm Password',
                controller: signupViewModel.confirmPasswordController,
                isPassword: true,
                //obscureText: signupViewModel.isPasswordVisible,
                validator: (value) {
                  if (value != signupViewModel.passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
                onSaved: (value) {
                  // No need to set the value here.
                },
                onPressed: () {
                  signupViewModel.toggleConfirmPasswordVisibility();
                },
              ),
              25.sbh,
              MyButton(
                width: 343.w,
                height: 48.h,
                onPressed: () async {
                  signupViewModel.signup(signupViewModel.emailController,
                      signupViewModel.passwordController);
                  // if (formKey.currentState!.validate()) {
                  //   await signupViewModel.signup(
                  //     signupViewModel.emailController.value.text.trim(),
                  //     signupViewModel.passwordController.value.text
                  //         .trim(),
                  //   );
                  // }
                },
                text: 'Sign Up',
                mystyle: btntextStyle(17, const Color(0xffFFFFFF),
                    FontWeight.w500, FontStyle.normal),
              ),
            ],
          ),
        ),
      )),
    );
  }

// void signup(String email, String password) async {
//   if (_formkey.currentState!.validate()) {
//     await _auth
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) => {postDetailsToFirestore(context)})
//         .catchError((e) {
//           return Utils.snackBar('error', e);
//     });
//   }
// }

  postDetailsToFirestore(BuildContext context) async {
    // calling our firestore
    // calling our usermodel
    // sending these vales

    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;

    userModel.name = signupViewModel.nameController.value.toString();
    userModel.phoneNumber =
        signupViewModel.phoneNumberController.value.toString();

    //await firebaseFirestore
    // .collection("users")
    // .doc(user.uid)
    // .set(userModel.toMap());

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text("Account created Successfully"),
    //     backgroundColor: Colors.green,
    //   ),
    // );

    Utils.snackBar(
      '',
      'Account created Successfully',
    );

    Get.toNamed(RoutesName.homeView);
  }
}
