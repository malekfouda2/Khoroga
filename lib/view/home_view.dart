import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khoroga/view/auth/login_view.dart';
class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
   HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Khoroga"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: (){
            _auth.signOut();
            Get.offAll(()=>LoginView());
          },
        ),
      ),
    );
  }
}
