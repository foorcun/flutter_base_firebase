import 'package:flutter_base_firebase/app/data/firebase_user_dal.dart';
import 'package:flutter_base_firebase/app/domain/entity/user.dart';
import 'package:get/get.dart';

//https://github.com/foorcun/getx_pattern/blob/main/lib/app/modules/restoranListView/controllers/restoran_list_view_controller.dart
class HomeController extends GetxController {
  //TODO: Implement HomeController

  final users = <User>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    users.bindStream(FirebaseUserDal().userList());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void userList() {
    FirebaseUserDal().userList();
  }

  Future<void> deleteUser(User u) async {
    await FirebaseUserDal().deleteUser(u);
  }
}
