import '/core/authentication_manager.dart';
import '/home.dart';
import '/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? const HomeView() : const LoginView();
    });
  }
}
