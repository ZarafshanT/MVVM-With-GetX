import 'package:flutter/material.dart';
import 'package:flutter_getx/view_model/controller/signUp/signup_view_model.dart';

import 'package:get/get.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final bool isPassword; // Remove suffixIcon property
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String? Function(String?)? onFieldSubmitted;
  final FocusNode? focusnode;
  final TextEditingController controller;
  final void Function()? onPressed;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.onFieldSubmitted,
    this.onSaved,
    this.onPressed,
    this.focusnode,
  });

  @override
  Widget build(BuildContext context) {
    final SignupViewModel signupViewModel = Get.find();
    return TextFormField(
      obscureText:
          isPassword ? !signupViewModel.isPasswordVisible.value : false,
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isPassword // Check if it's a password field
            ? Obx(() => IconButton(
                  icon: Icon(
                    signupViewModel.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    signupViewModel.togglePasswordVisibility();
                  },
                ))
            : null, // Remove suffixIcon from non-password fields
      ),
    );
  }
}
