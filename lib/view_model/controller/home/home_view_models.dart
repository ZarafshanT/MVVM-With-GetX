import 'package:flutter_getx/data/response/status.dart';
import 'package:flutter_getx/models/home/user_list_model.dart';
import 'package:flutter_getx/repository/home_repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.Loading.obs;
  final userList = UserListModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.Completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      print(error);
      setRxRequestStatus(Status.Error);
    });
  }
}
