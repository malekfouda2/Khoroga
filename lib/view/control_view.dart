import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/view_model/auth_view_model.dart';
import 'package:khoroga/view/auth/login_view.dart';
import 'package:khoroga/view/profile_view.dart';

import '../core/view_model/control_view_model.dart';
import 'favorites_view.dart';
import 'home_view.dart';
class ControlView extends GetWidget<AuthViewModel> {
  

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user==null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
            
            builder: (controller)=>Scaffold(
              body: controller.currentScreen,
              ),
          );
    });
  }

}
