import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:khoroga/model/top_rated_model.dart';
import 'package:khoroga/view/widgets/custom_text.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constant.dart';
class DetailsView extends StatelessWidget {
  final TopRatedModel model ;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(

    backgroundColor: primaryColor ,
    //minimumSize: Size(88, 36),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((10))
    ),

  );
   DetailsView({Key? key, required this.model}) : super(key: key);

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
                  padding: const EdgeInsets.all(18),

                  child: Column(
                    children:[ CustomText(text: model.name!,
                    fontSize: 26,
                    ),
                      const SizedBox(height: 15,),
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
                                const CustomText(
                                text: 'Branch'
                              ),
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
                      const SizedBox(height: 15,),
                      const CustomText(
                        text: "Review: ",
                        fontSize: 24,
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
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        width: 150,
                        child: ElevatedButton(
                            style: flatButtonStyle,
                            onPressed: _launchMap,
                            // onPressed: ()async{
                            //   const url = "https://www.google.com";
                            //   if(await canLaunchUrlString(url)){
                            //     await launchUrlString(url);
                            //   }else{
                            //     throw 'Could not Launch $url';
                            //   }
                            //
                            // },
                            child: const CustomText(
                              text: "Location",
                        ),
                      ),
                      //   child: Link(
                      //     target: LinkTarget.self,
                      //     uri: Uri.parse("https://www.google.com"),
                      //     builder: (context, followLink) => ElevatedButton(
                      //       style: flatButtonStyle,
                      //         onPressed: followLink,
                      //         child: const CustomText(text:"Location")
                      //     )
                      //
                      //   ),
                      )
                    ],

                  ),
                  Container(
                    padding:const EdgeInsets.all(20),
                    height: 100,
                    width: 150,

                    child: ElevatedButton(


                        style: flatButtonStyle,
                        onPressed: () {},
                        child: const CustomText(
                          text: "Favorite",
                        )
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
  _launchMap() async{
    final String googleMpasUrl= model.location!;
    if (await canLaunchUrlString(googleMpasUrl)) {
      await launchUrlString(googleMpasUrl);
    }
      else{
        throw " could not launch $googleMpasUrl";
    }

  }
}
