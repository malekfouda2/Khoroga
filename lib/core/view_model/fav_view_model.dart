import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/model/fav_place_model.dart';
import 'package:khoroga/service/database/fav_database_helper.dart';

import '../../constant.dart';

class FavViewModel extends GetxController{
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading= ValueNotifier(false);
  List<FavPlaceModel> _favPlaceModel=[];
  List<FavPlaceModel> get favPlaceModel => _favPlaceModel;

  FavViewModel(){
    getAllPlaces();
  }

  addPlace(FavPlaceModel favPlaceModel) async{
    var dbHelper = FavDatabaseHelper.db;
    await dbHelper.insert(favPlaceModel);
    update();
    Get.snackbar("Success", "Place added to favorites!", colorText: primaryColor, snackPosition: SnackPosition.TOP);


  }

  getAllPlaces() async{
  _loading.value= true;

  var dbHelper = FavDatabaseHelper.db;
  _favPlaceModel= await dbHelper.getAllPlaces();

  _loading.value= false;
  update();
    }
}