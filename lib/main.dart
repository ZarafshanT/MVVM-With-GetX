import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/res/getx_localization/languages.dart';
import 'package:flutter_getx/res/routes/routes.dart';
import 'package:flutter_getx/view/signup/signup_view.dart';
import 'package:flutter_getx/view/splash_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDfQfw0QAs0tJqO-f6I64XnqxsaAdFd8Tc",
        appId: "1:407925503071:android:d5a9fe6727f6b5b6d1d7ea",
        messagingSenderId: "407925503071",
        projectId: "com.example.GetX_MVVM"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          translations: Languages(),
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          getPages: AppRoutes.appRoutes(),
          home: SignUp(),
        );
      },
    );
  }
}
