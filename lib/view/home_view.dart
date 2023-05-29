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

import '../core/service/location_service.dart';
import '../model/category_model.dart';
import 'categories_view.dart';
class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) =>
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
                  
                    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CustomText(
          text: "Nearby Places",
          fontSize: 18,
        ),
        
      ],
    ),
    SizedBox(height: 20),
    _listViewNearbyPlaces(),

                  ],
                ),
              ),
            ),
          ),

        )

    );
  }
  Widget _listViewNearbyPlaces() {
  return GetBuilder<LocationService>(
    builder: (locationService) {
      final List<dynamic>? nearbyPlaces = locationService.nearbyPlaces;

      if (nearbyPlaces == null) {
        return CircularProgressIndicator(); // Show a loading indicator while fetching nearby places
      } else {
        return Container(
          height: 400,
          child: ListView.separated(
            itemCount: nearbyPlaces.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final place = nearbyPlaces[index];
              final name = place['name'];
              final vicinity = place['vicinity'] ?? 'Unknown';
              final photos = place['photos'];

              // Get the first photo reference and construct the image URL
              String imageUrl = '';
              if (photos != null && photos.length > 0) {
                final photoReference = photos[0]['photo_reference'];
                imageUrl =
                    'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=${locationService.apiKey}';
              }

              return GestureDetector(
                onTap: () {
                  Get.to(DetailsView(model: place));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                        child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: imageUrl.isNotEmpty
                              ? Image.network(
                                  imageUrl,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Placeholder icon when loading fails
                                    return Icon(
                                      Icons.photo,
                                      size: 100,
                                    );
                                  },
                                )
                              : Icon(
                                  Icons.photo,
                                  size: 100,
                                ),
                        ),
                      ),
                      SizedBox(height: 3),
                      CustomText(
                        text: name,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        text: vicinity,
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
      }
    },
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
  Widget _listViewCategories() {
  return GetBuilder<HomeViewModel>(
    builder: (controller) {
      
        return Container(
          height: 100,
          child: ListView.separated(
            itemCount: controller.categoryModel!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                        CategoryModel tappedCategory = controller.categoryModel![index];
                        onTapCategory(tappedCategory);
                      },
                child: Column(
                  children: [
                    
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        height: 60,
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            controller.categoryModel![index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    
                    SizedBox(height: 20),
                    CustomText(text: controller.categoryModel![index].name!),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20),
          ),
        );
      
    },
  );
}

void onTapCategory(CategoryModel category) {
  Get.find<HomeViewModel>().fetchPlacesByCategory(category.name!);
  Get.to(CategoryPage(categoryName: category.name!));
}



  Widget _listViewTopRated(){
    return GetBuilder<HomeViewModel>(
        builder: (controller) {
          return Container(
            height: 300,
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


}