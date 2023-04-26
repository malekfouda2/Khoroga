import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/favorites_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue=0;
  
  get navigatorValue => _navigatorValue;

  Widget currentScreen= HomeView();

  
  void changeSelectedValue(int selectedValue){
    _navigatorValue=selectedValue;
          if(selectedValue==0){
              currentScreen=HomeView();
              Get.to(()=>HomeView());
          }
          if(selectedValue==1){
              currentScreen=FavoritesView();
              Get.to(()=>FavoritesView());
          }
          if(selectedValue==2){
              currentScreen=ProfileView();
              Get.to(()=>ProfileView());
          } 
  }
}
    