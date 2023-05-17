import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/view_model/review_view_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../model/top_rated_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/view_model/review_view_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../model/top_rated_model.dart';

class ReviewScreen extends StatelessWidget {
  final ReviewController controller;

  const ReviewScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewController>(
      init: controller,
      builder: (context) {
        return Obx(
          () {
            final reviews = controller.reviews;

            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return ListTile(
                  title: Text(review.author),
                  subtitle: Text(review.text),
                  trailing: RatingBar.builder(
                    initialRating: review.value,
                    ignoreGestures: true,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {
                      // Do nothing since we only want to display the rating
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
