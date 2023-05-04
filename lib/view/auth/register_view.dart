import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constant.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_text.dart';
import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0 ,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.off(()=>LoginView());
          },
          child: Icon(Icons.arrow_back,color:Colors.black,size: 30,)
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(
                  text: "Sign Up",
                  fontSize: 30,
                ),
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
            CustomText(text: "Name:"
            ,
                fontSize: 14,
                color: Colors.grey.shade900),
            TextFormField(
              onSaved: (value){
                controller.name=value!;
          
              },
              validator: ( value){
                if(value== null){
                  print("Error");
                }
              } ,
              decoration: InputDecoration(
          
                  hintText: "Your Name here",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  fillColor: Colors.black
              ),
            ),
              const  SizedBox(
                  height: 40,
                ),
          
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
              obscureText:true,
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
          
            ElevatedButton(
              style: flatButtonStyle,
          
              onPressed:(){
                formKey.currentState?.save();
          
                if(formKey.currentState!.validate()){
                  controller.createAccountWithEmailAndPassword();
          
                }
          
              },
              child:  CustomText(text: "SIGN UP",
                alignment: Alignment.center,
                color: Colors.black,
              ),
            ),
                  ],
          
            ),
          ),
        ),
      ),
    );
  }
}
