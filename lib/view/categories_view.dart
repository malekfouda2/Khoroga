import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/view/widgets/custom_text.dart';

import '../core/view_model/home_view_model.dart';
import '../model/place_model.dart';
import '../model/top_rated_model.dart';
import 'details_view.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final HomeViewModel homeViewModel = Get.find();

  CategoryPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous screen
          },
        ),
      ),
      body: GetBuilder<HomeViewModel>(
        builder: (controller) {
          List<PlaceModel> places = controller.placesmodel!;

          if (places.isEmpty) {
            return const Center(
              child: CircularProgressIndicator()
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];

                return GestureDetector(
                  onTap: () {
                    TopRatedModel convertToTopRatedModel(PlaceModel place) {
                      return TopRatedModel(
                        name: place.name,
                        image: place.image,
                        branch: place.branch,
                        lat: place.lat,
                        lng: place.lng,
                        color: place.color,
                        placeId: place.placeId,
                        // Copy other relevant properties from the PlaceModel
                      );
                    }

                    TopRatedModel topRatedModel = convertToTopRatedModel(place);
                    Get.to(DetailsView(model: topRatedModel));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.network(
  place.image!,
  fit: BoxFit.cover,
),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.name!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                place.branch!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
            ),
          );
        },
      ),
    );
  }
}
