import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.userList();
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
          Obx(() => Expanded(
              child: controller.users.length < 1
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        var u = controller.users;

                        return Slidable(
                          child: Card(
                            child: ListTile(
                              title: Text(u[index].toString()),
                            ),
                          ),
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: ((context) async {
                                  await controller.deleteUser(u[index]);
                                }),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_forever,
                                label: 'Delete',
                              )
                            ],
                          ),
                        );
                      })))
        ],
      ),
    );
  }
}
