import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base_firebase/app/data/firebase_user_dal.dart';
import 'package:flutter_base_firebase/app/domain/entity/user.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController {
  //TODO: Implement AddUserController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addUser() async {
    var user = User(id: 1, name: "furkan");

    try {
      FirebaseUserDal().addUser(user);

      Get.defaultDialog(
          title: "basarili",
          middleText: "${user.toString()} eklendi.",
          onConfirm: () => Get.back(),
          textConfirm: "Ok");
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: "hata", middleText: "void addUser() de bir hata olustu");
    }
  }
}
