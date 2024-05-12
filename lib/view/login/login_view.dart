import 'package:flutter/material.dart';
import 'package:flutter_getx/res/commom_widgets/round_button.dart';
import 'package:flutter_getx/res/commom_widgets/customTextFormFiled/textFormField.dart';
import 'package:flutter_getx/res/constants/extensions/sizedbox_extension.dart';
import 'package:flutter_getx/utils/utils.dart';
import 'package:flutter_getx/view_model/controller/login/login_view_model.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  //EditTextUtils _editTextUtils = EditTextUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextFormField(
                      hintText: 'email_hint'.tr,
                      controller: loginVM.emailController.value,
                      focusnode: loginVM.emailFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar('Email', 'Enter Email');
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieledFocusChange(
                            context,
                            loginVM.emailFocusNode.value,
                            loginVM.passwordFocusNode.value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar('Pasword', 'Enter Pasword');
                        }
                        return '';
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieledFocusChange(context, loginVM.passwordFocusNode.value, loginVM.isLoading as FocusNode);
                      },
                      decoration: InputDecoration(
                          hintText: 'password_hint'.tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
            40.sbh,
            
            Obx((() => RoundButton(
                width: 200,
                title: 'login'.tr,
                loading: loginVM.isLoading.value,
                onPress: (() {
                  if (_formkey.currentState!.validate()) {
                    loginVM.login(loginVM.emailController.toString(),
                        loginVM.passwordController.toString());
                  }
                }))))
          ]),
    );
  }
}
