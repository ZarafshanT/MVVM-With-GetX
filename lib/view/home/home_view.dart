import 'package:flutter/material.dart';
import 'package:flutter_getx/data/response/status.dart';
import 'package:flutter_getx/res/routes/routes_name.dart';
import 'package:flutter_getx/view_model/controller/home/home_view_models.dart';
import 'package:flutter_getx/view_model/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  UserPreferences userPreference = UserPreferences();

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              UserPreferences.clearUser().then((value) {
                Get.toNamed(RoutesName.loginView);
              });
            },
            icon: const Icon(Icons.logout))
      ]),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.Loading:
            return const Center(child: CircularProgressIndicator());
          case Status.Error:
            return Text(Status.Error.toString());
          case Status.Completed:
            return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: ((context, index) {
                  return Card(
                      child: ListTile(
                          title: Text(homeController
                              .userList.value.data![index].firstName
                              .toString())));
                }));
        }
      }),
    );
  }
}
