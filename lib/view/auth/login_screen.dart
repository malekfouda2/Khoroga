import 'package:flutter/material.dart';
import 'package:khoroga/constant.dart';
import 'package:khoroga/view/widgets/custom_button.dart';
import 'package:khoroga/view/widgets/custom_text.dart';
import 'package:khoroga/view/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(

       backgroundColor: primaryColor ,
    //minimumSize: Size(88, 36),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((10))
    ),

    );
  final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(

    backgroundColor: Colors.white ,
    //minimumSize: Size(88, 36),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((10))
    ),

  );
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0 ,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:const [
                CustomText(
                  text: "Welcome",
                  fontSize: 30,
                ),
                CustomText(
                  text: "Sign Up",
                  color: primaryColor,
                  fontSize: 18,
                ),

              ],
            ),
           const SizedBox(
              height: 10,
            ),
          const  CustomText(text: "Sign In to continue",
            fontSize: 14,
            color: Colors.grey,),
           const SizedBox(
              height: 30,
            ),
          const  CustomTextFormField(
              text: "Email",
              hint: 'example@email.com',

            ),
          const  SizedBox(
              height: 40,
            ),
          const  CustomTextFormField(
              text: "Password",
              hint: 'Enter Password Here',

            ),
           const SizedBox(height: 20,),
           const CustomText(
             text: 'Forgot Password?',
             fontSize: 14,
             alignment: Alignment.topRight,
            ),
           const SizedBox(height:20),
           CustomButton(text: "SIGN IN"),
           const SizedBox(height: 20,),
           const CustomText(text: "------OR------",
            alignment: Alignment.center,),
            const SizedBox(height: 40,),
            ElevatedButton(
              style: flatButtonStyle2,
              onPressed: (){},
              child: Row(
                children: [
                  Image.asset('assets/images/google.png'),
                  const SizedBox(width: 90,),
                  const CustomText(text:"Sign In With Google" ,),

                ],
              ),



            ),
        const SizedBox(height: 20,),
        ElevatedButton(
          style: flatButtonStyle2,
          onPressed: (){},
          child: Row(
            children: [
              Image.asset('assets/images/facebook.png'),
              const SizedBox(width: 90,),
              const CustomText(text:"Sign In With Facebook" ,),

            ],
          ),

        )
          ],

        ),
      ),
    );
  }
}
