import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddUserView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'AddUserView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () async {
                  controller.addUser();
                },
                child: Text("add product"))
          ],
        ),
      ),
    );
  }
}
