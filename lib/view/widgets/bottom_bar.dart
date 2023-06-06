import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../core/view_model/control_view_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller)=>
 BottomNavigationBar(
        items:  const [
          BottomNavigationBarItem(
            label:"Explore",
            icon: Icon(Icons.explore)
            ),
            BottomNavigationBarItem(
              label: "Favorites",
            icon: Icon(Icons.favorite)
            ),
            BottomNavigationBarItem(
              label: "Collaboration",
            icon: Icon(Icons.group_rounded)
            ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        ),
    );
  }
}