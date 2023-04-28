import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/view_model/fav_view_model.dart';
import 'package:khoroga/view/widgets/bottom_bar.dart';
import 'package:khoroga/view/widgets/custom_text.dart';

import '../constant.dart';

class FavoritesView extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(

    backgroundColor:Colors.red ,
    //minimumSize: Size(88, 36),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((10))
    ),

  );

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: Column(
        children: [
          Expanded(

            child: GetBuilder<FavViewModel>(
              init: FavViewModel(),
              builder:(controller)=> Container(
                child: ListView.separated(itemBuilder:(context, index){
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 170,
                            child: Image.network(controller.favPlaceModel[index].image!, fit: BoxFit.fill )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: controller.favPlaceModel[index].name!,
                                fontSize: 30,
                              ),
                              const SizedBox(height: 10,),
                              CustomText(
                                color: primaryColor,
                                text: controller.favPlaceModel[index].branch!,
                                fontSize: 20,
                              ),


                            ],
                          ),
                        )
                      ],
                    )
                  );
                } ,itemCount:controller.favPlaceModel.length, separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 15,);
                },),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: 150,
                  child: ElevatedButton(onPressed: (){},

                      style: flatButtonStyle,
                        child: CustomText(text:"Delete All")),
                )
              ],
            ),
          )
        ],
      ),
      
    );
  }
}