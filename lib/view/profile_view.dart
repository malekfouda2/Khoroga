import 'package:flutter/material.dart';
import 'package:khoroga/view/widgets/bottom_bar.dart';


class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomBar(),
    );
  }
}