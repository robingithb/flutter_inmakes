import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/user_data/controller/user_controller.dart';
import 'package:my_first_app/user_data/model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Data"),
        ),
        body: Center(
          child: GetX<UserController>(
            init: UserController(),
            builder: (controller) {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    User user = controller.users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
