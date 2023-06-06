import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khoroga/view/widgets/bottom_bar.dart';
import 'package:khoroga/view/widgets/custom_text.dart';

import '../constant.dart';


class ProfileView extends StatelessWidget {
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
                  text: "Collaboration Request",
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
                CustomText(text: "How do you engage with your followers:"
                    ,
                    fontSize: 14,
                    color: Colors.grey.shade900),
                TextFormField(
                  onSaved: (value){

                  },
                  validator: ( value){
                    if(value== null){
                      print("Error");
                    }
                  } ,
                  decoration: InputDecoration(

                      hintText: "",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      fillColor: Colors.black
                  ),
                ),
                const  SizedBox(
                  height: 40,
                ),

                CustomText(text: "Which social media platforms are you on:"
                    ,
                    fontSize: 14,
                    color: Colors.grey.shade900),
                TextFormField(
                  onSaved: (value){

                  },
                  validator: ( value){
                    if(value== null){
                      print("Error");
                    }
                  } ,
                  decoration: InputDecoration(

                      hintText: "",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      fillColor: Colors.black
                  ),
                ),
                const  SizedBox(
                  height: 40,
                ),

                CustomText(text:"Have you ever created content for a niche similar to ours",
                  fontSize: 14,
                  color: Colors.grey.shade900,
                ),

                TextFormField(
                  onSaved: (value){

                  },
                  validator: ( value){
                    if(value == null){
                      print("Error");
                    }
                  } ,
                  decoration: InputDecoration(

                      hintText: "",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      fillColor: Colors.black
                  ),
                ),
                const  SizedBox(
                  height: 40,
                ),

                CustomText(text:"What content type do you prefer",
                  fontSize: 14,
                  color: Colors.grey.shade900,
                ),

                TextFormField(
                  onSaved: (value){

                  },
                  validator: ( value){
                    if(value == null){
                      print("Error");
                    }
                  } ,
                  decoration: InputDecoration(

                      hintText: "",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      fillColor: Colors.black
                  ),
                ),


                const  SizedBox(
                  height: 40,
                ),

                CustomText(text:"What is your target audience ",
                  fontSize: 14,
                  color: Colors.grey.shade900,
                ),

                TextFormField(
                  onSaved: (value){

                  },
                  validator: ( value){
                    if(value == null){
                      print("Error");
                    }
                  } ,
                  decoration: InputDecoration(

                      hintText: "",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      fillColor: Colors.black
                  ),
                ),



                const  SizedBox(
                  height: 40,
                ),

                CustomText(text:"What are your thoughts on our services ",
                  fontSize: 14,
                  color: Colors.grey.shade900,
                ),

                TextFormField(
                  onSaved: (value){

                  },
                  validator: ( value){
                    if(value == null){
                      print("Error");
                    }
                  } ,
                  decoration: InputDecoration(

                      hintText: "",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      fillColor: Colors.black
                  ),
                ),


                const  SizedBox(
                  height: 40,
                ),

                CustomText(text:"How much will you charge for the sponsored posts",
                  fontSize: 14,
                  color: Colors.grey.shade900,
                ),

                TextFormField(
                  onSaved: (value){

                  },
                  validator: ( value){
                    if(value == null){
                      print("Error");
                    }
                  } ,
                  decoration: InputDecoration(

                      hintText: "",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      fillColor: Colors.black
                  ),
                ),




                const SizedBox(height: 20,),

                GestureDetector(
                  onTap:(){

                  },
                  child: ElevatedButton(
                    style: flatButtonStyle,

                    onPressed:(){

                    Get.to(ProfileView());
                    Get.snackbar(
                      'Success', // Snackbar title
                      'Request Submitted', // Snackbar message
                      snackPosition: SnackPosition.TOP, // Position of the snackbar
                    );


                    },
                    child: const CustomText(text: "Submit",
                      alignment: Alignment.center,
                      color: Colors.black,
                    ),
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