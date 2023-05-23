import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khoroga/view/auth/login_view.dart';
import 'package:get/get.dart';
import 'package:khoroga/view/control_view.dart';
import 'package:khoroga/view/home_view.dart';

import 'helper/binding.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: LoginView(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),

    );
  }
}
