import 'package:flutter_getx/res/routes/routes_name.dart';
import 'package:flutter_getx/view/home/home_view.dart';
import 'package:flutter_getx/view/login/login_view.dart';
import 'package:flutter_getx/view/signup/signup_view.dart';
import 'package:flutter_getx/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesName.signupView,
            page: () => SignUp(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesName.homeView,
            page: () => const HomeView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade)
      ];
}
