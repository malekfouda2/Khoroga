import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:khoroga/view/widgets/review_screen.dart';

import '../../core/view_model/review_view_model.dart';
import '../../model/review_model.dart';

class AddReviewScreen extends StatefulWidget {
  

  const AddReviewScreen({super.key});
  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}


class _AddReviewScreenState extends State<AddReviewScreen> {
  late final ReviewController _reviewController;
  final _formKey = GlobalKey<FormState>();
  final _authorController = TextEditingController();
  final _textController = TextEditingController();
  double _value = 0.0;
    

  @override
  void initState() {
    super.initState();
    _reviewController = Get.find<ReviewController>();
  }

  @override
  void dispose() {
    _authorController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            TextFormField(
              controller: _textController,
              decoration:  InputDecoration(labelText: 'Review Text',labelStyle: TextStyle(fontSize: 20,color: Colors.grey.shade800),),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the review text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RatingBar.builder(
              initialRating: _value,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _value = rating;
                });
              },
            ),
            SizedBox(height: 26.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final author = _authorController.text;
                    final text = _textController.text;
            
                    final review = Review(
                      id: '',
                      author: 'Hana',
                      text: text,
                      value: _value,
                    );
            
                    _reviewController.addReview(review);
                    _authorController.clear();
                    _textController.clear();
                    setState(() {
                      _value = 0.0;
                    });
                    
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800, // Background color
                ),
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}