import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/view_model/fav_view_model.dart';
import 'package:khoroga/core/view_model/home_view_model.dart';
import 'package:khoroga/model/fav_place_model.dart';
import 'package:khoroga/model/top_rated_model.dart';
import 'package:khoroga/view/widgets/add_review.dart';
import 'package:khoroga/view/widgets/custom_text.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../constant.dart';
import '../core/view_model/review_view_model.dart';
import '../utils/map_utils.dart';
import 'widgets/review_screen.dart';
class DetailsView extends StatelessWidget {
  final TopRatedModel model ;
  final _reviewController = Get.put(ReviewController());
  
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(

    backgroundColor: primaryColor ,
    //minimumSize: Size(88, 36),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((10))
    ),

  );
   DetailsView({Key? key, required this.model}) : super(key: key){
    _reviewController.setPlaceId(model.placeId!);
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                  model.image!,
                  fit: BoxFit.fill
              ),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const 
                   EdgeInsets.all(1),

                  child: Column(
                    children:
                    [
                      Text(
                        model.name!,
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                            )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:[
                                CustomText(
                                    text: model.branch!
                                ),
                              ]
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:const [
                                  CustomText(
                                    text: 'Cairo, Egypt'
                                ),

                                ]
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 0,
                        ),
                      Padding(
                          padding: const EdgeInsets.all(0),
child: DefaultTabController(
  length: 2,
  child: GetBuilder<HomeViewModel>(

    builder: (controller) {
      int index = 0; // Define the index variable here (assign the desired value)
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TabBar(
            labelColor: Colors.black,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Color(0xFF3A3F47),
            tabs: [
              Tab(text: 'Add Review'),
              Tab(text: 'View Reviews'),
            ],
          ),
          SizedBox(
            height: 500,
            child: TabBarView(
              children: [
                AddReviewScreen(),
                ReviewScreen(controller: _reviewController),
              ],
            ),
          ),
        ],
      );
    },
  ),
),

                        ),
                      
                      
                      // SizedBox(height: 10,),
                      // CustomText(text: model.branch!,
                      // fontSize: 20,)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    width: 150,
                    child: ElevatedButton(
                        style: flatButtonStyle,
                        onPressed: (){MapUtils.openMap(model.lat!, model.lng!);},
                        child: const CustomText(
                          text: "Location",
                          alignment: Alignment.center,
                    ),
                  ),
                  ),
                  GetBuilder<FavViewModel>(
                    init: FavViewModel(),
                    builder:(controller)=> Container(
                      padding:const EdgeInsets.all(20),
                      height: 100,
                      width: 150,

                      child: ElevatedButton(


                          style: flatButtonStyle,
                          onPressed: () {
                            controller.addPlace(
                              FavPlaceModel(
                                name: model.name,
                                image: model.image,
                                branch: model.branch,
                                placeId: model.placeId
                              )
                            );

                          },
                          child: const CustomText(
                            text: "Favorite",
                            alignment: Alignment.center,
                          )
                      ),

                    ),
                  )

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
  
}
