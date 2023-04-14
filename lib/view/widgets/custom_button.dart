import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../constant.dart';
import 'custom_text.dart';
class CustomButton extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(

    backgroundColor: primaryColor ,
    //minimumSize: Size(88, 36),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((10))
    ),

  );
  final String text;


   CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: flatButtonStyle,

      onPressed:(){},
      child:  CustomText(text: text,
        alignment: Alignment.center,
        color: Colors.black,
      ),
    );
  }
}
