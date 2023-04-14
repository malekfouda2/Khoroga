import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import 'custom_text.dart';
class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;

  const CustomTextFormField({Key? key, required this.text, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
  child:
  Column(
    children: [
      CustomText(
        text: text,
        fontSize: 14,
        color: Colors.grey.shade900,
      ),
      TextFormField(

        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.grey
            ),
            fillColor: Colors.black
        ),
      )
    ],
  ),

    );
  }
}
