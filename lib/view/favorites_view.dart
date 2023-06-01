import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/view_model/fav_view_model.dart';
import 'package:khoroga/view/widgets/bottom_bar.dart';
import 'package:khoroga/view/widgets/custom_text.dart';

import '../constant.dart';

class FavoritesView extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.red,
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GetBuilder<FavViewModel>(
              init: FavViewModel(),
              builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: controller.favPlaceModel.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    final favPlace = controller.favPlaceModel[index];
                    return InkWell(
                      onTap: () {
                        // Handle tap on the favorite place item
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(favPlace.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      favPlace.name!,
                                      style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      favPlace.branch!,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: primaryColor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 12),
            child: GetBuilder<FavViewModel>(
              init: FavViewModel(),
              builder: (controller) => ElevatedButton(
                onPressed: () {
                  controller.deletePlace();
                },
                style: flatButtonStyle,
                child: CustomText(text: "Delete All",color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
