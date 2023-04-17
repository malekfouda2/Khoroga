import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/view_model/auth_view_model.dart';
import 'package:khoroga/view/auth/login_screen.dart';

import 'home_view.dart';
class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user!=null)
          ? HomeView()
          : LoginScreen();
    });
  }
}
