import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khoroga/core/view_model/control_view_model.dart';
import 'package:khoroga/core/view_model/home_view_model.dart';
import 'package:khoroga/view/auth/login_view.dart';
import 'package:khoroga/view/details_view.dart';
import 'package:khoroga/view/favorites_view.dart';
import 'package:khoroga/view/widgets/bottom_bar.dart';
import 'package:khoroga/view/widgets/custom_text.dart';

import '../core/view_model/location_controller.dart';

class HomeView extends StatelessWidget {
  final LocationController locationController = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) =>controller.loading.value ? Center(child: CircularProgressIndicator()):
        Scaffold(
          bottomNavigationBar: const BottomBar(),
          body:SingleChildScrollView(
            child: Container(
              padding:EdgeInsets.only(top:50,left:20,right:20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _searchFormField(),
                    SizedBox(height: 20,),
                    CustomText(
                      text: "Categories",
                      fontSize: 18,
                    ),
                    SizedBox(height: 30,),
                    _listViewCategories(),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(
                            text: "Top rated",
                            fontSize: 18
                        ),
                        CustomText(
                          text: "See all",
                          fontSize: 16,
                        )
                      ],),
                    SizedBox(height: 20,),
                    _listViewTopRated(),
                    SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(
                            text: "Top rated",
                            fontSize: 18
                        ),
                        CustomText(
                          text: "See all",
                          fontSize: 16,
                        )
                      ],),
                    SizedBox(height: 20,),
                    _listViewNearby(),
                    SizedBox(height:20),



                  ],
                ),
              ),
            ),
          ),

        )

    );
  }
  Widget _searchFormField(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color:Colors.grey.shade200,
      ),

      child: TextFormField(
          decoration:InputDecoration(
            border:InputBorder.none,
            prefixIcon:const Icon(Icons.search,color:Colors.black),
          )
      ),
    );
  }
  Widget _listViewCategories(){
    return GetBuilder<HomeViewModel>(
        builder: (controller) {
          return Container(
            height: 100,
            child: ListView.separated(
              itemCount: controller.categoryModel!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      height:60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(controller.categoryModel![index].image!,fit: BoxFit.cover,),
                      ),
                    ),
                    SizedBox(height: 20,),
                    CustomText(text: controller.categoryModel![index].name!,)
                  ],
                );
              }, separatorBuilder: ( context, index)=> SizedBox(width: 20,)  ,
            ),
          );
        }
    );
  }
  Widget _listViewTopRated(){
    return GetBuilder<HomeViewModel>(
        builder: (controller) {
          return Container(
            height: 350,
            child: ListView.separated(
              itemCount:controller.topRatedModel!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: () {
                    Get.to(DetailsView(
                      model: controller.topRatedModel![index]
                    ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*.4,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade300,
                          ),

                          child:
                          Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width*.4,
                            decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:NetworkImage(controller.topRatedModel![index].image!),
                                    fit: BoxFit.fitHeight )
                            ),

                          ),


                        ),
                        SizedBox(height: 3,),
                        CustomText(text:controller.topRatedModel![index].name!,alignment: Alignment.bottomLeft,),
                        SizedBox(height: 5,),
                        CustomText(text:controller.topRatedModel![index].branch!,color: Colors.grey.shade500,alignment: Alignment.bottomLeft)
                      ],
                    ),
                  ),
                );
              }, separatorBuilder: ( context, index)=> SizedBox(width: 30,)  ,
            ),
          );
        }
    );

  }
  Widget _listViewNearby() {
    return GetBuilder<LocationController>(
      builder: (controller) {
        return Container(
          height: 350,
          child: ListView.separated(
            itemCount: controller.nearbyPlaces.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final place = controller.nearbyPlaces[index];
              return GestureDetector(
                onTap: () {
                  // Handle onTap event
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                        // child: Container(
                        //   height: 220,
                        //   width: MediaQuery.of(context).size.width * .4,
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: NetworkImage(place.image),
                        //       fit: BoxFit.fitHeight,
                        //     ),
                        //   ),
                        // ),
                      ),
                      SizedBox(height: 3),
                      CustomText(
                        text: place.name,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        text: place.address,
                        color: Colors.grey.shade500,
                        alignment: Alignment.bottomLeft,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 30),
          ),
        );
      },
    );
  }



}


