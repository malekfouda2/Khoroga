import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../model/review_model.dart';
import '../../model/top_rated_model.dart';

class ReviewController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Review> reviews = <Review>[].obs;
  String? placeId; // Added placeId variable

  @override
  void onInit() {
    super.onInit();
    // Fetch all reviews by default
    fetchReviews();
  }

  Future<void> fetchReviews({TopRatedModel? topRatedModel}) async {
    try {
      Query<Map<String, dynamic>> query =
          _firestore.collection('reviews');

      // If a specific TopRatedModel is provided, filter the reviews by placeId
      if (topRatedModel != null && topRatedModel.placeId != null) {
        query = query.where('placeId', isEqualTo: topRatedModel.placeId);
      }

      final querySnapshot = await query.get();
      reviews.value = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Review(
          id: doc.id,
          author: data['author'],
          text: data['text'],
          value: data['value'],
        );
      }).toList();
    } catch (e) {
      // Handle error
    }
  }

  void setPlaceId(String placeId) {
    this.placeId = placeId; // Assign the provided placeId
    fetchReviews();
  }

  Future<void> addReview(Review review) async {
    try {
      await _firestore.collection('reviews').add({
        'placeId': placeId, // Use the assigned placeId
        'author': review.author,
        'text': review.text,
        'value': review.value,
        'created_at': FieldValue.serverTimestamp(),
      });
      updateReviews();
      Get.snackbar(
        'Success',
        'Review added!',
        colorText: primaryColor,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add review: ${e.toString()}',
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
  void updateReviews() {
    // Fetch the updated list of reviews
    fetchReviews();
  }
}
