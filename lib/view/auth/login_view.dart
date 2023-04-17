import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/constant.dart';
import 'package:khoroga/core/view_model/auth_view_model.dart';
import 'package:khoroga/view/auth/register_view.dart';
import 'package:khoroga/view/widgets/custom_button.dart';
import 'package:khoroga/view/widgets/custom_text.dart';
import 'package:khoroga/view/widgets/custom_text_form_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
   LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0 ,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome",
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>RegisterView());
                    },
                    child: CustomText(
                      text: "Sign Up",
                      color: primaryColor,
                      fontSize: 18,
                  
                    ),
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
              // CustomTextFormField(
              //   onSaved:(value){
              //     controller.email=value;
              //   },
              //   validator:( value){
              //     if(value== null){
              //       print("Error");
              //     }
              //   } ,
              //   text: "Email",
              //   hint: 'example@email.com',
              //
              // ),
          CustomText(text: "Email:"
          ,
              fontSize: 14,
              color: Colors.grey.shade900),
          TextFormField(
            onSaved: (value){
              controller.email=value!;

            },
            validator: ( value){
              if(value== null){
                print("Error");
              }
            } ,
            decoration: InputDecoration(

                hintText: "example@email.com",
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                fillColor: Colors.black
            ),
          ),
            const  SizedBox(
                height: 40,
              ),

          CustomText(text:"Password",
              fontSize: 14,
              color: Colors.grey.shade900,
          ),

          TextFormField(
            onSaved: (value){
              controller.password= value!;

            },
            validator: ( value){
              if(value == null){
                print("Error");
              }
            } ,
            decoration: InputDecoration(

                hintText: "Enter password here",
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                fillColor: Colors.black
            ),
          ),



             const SizedBox(height: 20,),
             const CustomText(
               text: 'Forgot Password?',
               fontSize: 14,
               alignment: Alignment.topRight,
              ),
             const SizedBox(height:20),

          ElevatedButton(
            style: flatButtonStyle,

            onPressed:(){
              formKey.currentState?.save();

              if(formKey.currentState!.validate()){
                controller.signInWithEmailAndPassword();

              }

            },
            child:  CustomText(text: "SIGN IN",
              alignment: Alignment.center,
              color: Colors.black,
            ),
          ),
             const SizedBox(height: 20,),
             const CustomText(text: "------OR------",
              alignment: Alignment.center,),
              Expanded(
                child: Container(
                ),
              ),
              ElevatedButton(
                style: flatButtonStyle2,
                onPressed: (){
                  controller.googleSignInMethod();
                },
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
            onPressed: (){
              controller.facebookSignInMethod();
            },
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
      ),
    );
  }
}
