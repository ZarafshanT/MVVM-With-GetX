import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_getx/res/routes/routes_name.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(RoutesName.splashScreen)
        : Get.offAll(RoutesName.homeView);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
