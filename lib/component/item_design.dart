
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kickapp/app_view/signup_view.dart';
import 'package:kickapp/services/bindings/sign_up_bindings.dart';
import 'package:kickapp/services/data_not_found.dart';
import 'package:kickapp/widget/custom_button.dart';

import '../app_model/post_model.dart';
import '../app_view/item_details_view.dart';
import '../services/app_keys.dart';
import '../services/bindings/item_details_bindings.dart';

endingSoon(BuildContext context, {required  List<mainPostModel> postData, required String discover})=> Column(
    children: [
    if(boxStorage.read(Keys.token) == null)...[
       Padding(
         padding: const EdgeInsets.all(15.0),
         child: CustomButton(
           appLabel: "Sign Up & Login", 
           isLodding: RxBool(false), 
           onPressed: (){
             Get.to(()=>SiginUpView(),binding: SignUpBindings(),transition: Transition.downToUp);
             // Get.to(()=> SignUpController(),binding: SignUpBindings(), transition: Transition.leftToRight);
             print("One");
           }
         ),
       ),
    ],

    Expanded(
      child: postData.isEmpty ? SizedBox(
        child: DataNotFound(),
      ) : ListView.builder(
        itemCount: postData.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context , int){
          return InkWell(
            onTap: (){
               Get.to(()=>ItemDetailsView(postId: postData[int].postId!,), binding: ItemDetailsBindings(), transition: Transition.rightToLeft);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postData[int].postThumbnailUrl!),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text(postData[int].postTitle!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                             ),
                             SizedBox(height: 4,),
                             Text(postData[int].postSubTitle!,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                            //  Text( "Target price : " + postData[int].targetPrice!,
                            //     style: TextStyle(
                            //       color: Colors.red,
                            //       fontWeight: FontWeight.normal,
                            //       fontSize: 15,
                            //     ),
                            //  ),
                             Text( "Post category : " + postData[int].postCategory!,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                             Row(
                               children: [
                                 CircleAvatar(
                                   backgroundColor: Colors.greenAccent,
                                   child: ClipOval(
                                     //.svg
                                     child: postData[int].authorAvatarUrl!.contains(".svg") == true ?  SvgPicture.network(postData[int].authorAvatarUrl!) : Image.network(postData[int].authorAvatarUrl!),
                                   ),
                                 ),
                                 SizedBox(width: 8,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                      Text(  postData[int].authorFullName!,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 11,
                                          ),
                                      ),
                                      // Text( "DonatedBy : " + postData[int].donatedBy.toString(),
                                      //     style: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontWeight: FontWeight.normal,
                                      //       fontSize: 11,
                                      //     ),
                                      // ),
                                   ],
                                 )
                               ],
                             ),
                            ],
                          ),
                        ),
                      ],
                  ),
                
                ),
              ),
            ),
          );
        }
      ),
    ),
  ],
);

discover(BuildContext context, {required  List<mainPostModel> postData, required String discover})=> Column(
    children: [
    if(boxStorage.read(Keys.token) == null)...[
       Padding(
         padding: const EdgeInsets.all(15.0),
         child: CustomButton(
           appLabel: "Sign Up & Login", 
           isLodding: RxBool(false), 
           onPressed: (){
             Get.to(()=>SiginUpView(),binding: SignUpBindings(),transition: Transition.downToUp);
           }
         ),
       ),
    ],
    Expanded(
      child: postData.isEmpty ? SizedBox(
        child: DataNotFound(),
      ) :  ListView.builder(
        itemCount: postData.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context , int){
          return InkWell(
            onTap: (){
               Get.to(()=>ItemDetailsView(postId: postData[int].postId!,), binding: ItemDetailsBindings(), transition: Transition.rightToLeft);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postData[int].postThumbnailUrl!),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text(postData[int].postTitle!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                             ),
                             SizedBox(height: 4,),
                             Text(postData[int].postSubTitle!,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                            //  Text( "Target price : " + postData[int].targetPrice!,
                            //     style: TextStyle(
                            //       color: Colors.red,
                            //       fontWeight: FontWeight.normal,
                            //       fontSize: 15,
                            //     ),
                            //  ),
                             Text( "Post category : " + postData[int].postCategory!,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                             Row(
                               children: [
                                 CircleAvatar(
                                   backgroundColor: Colors.greenAccent,
                                   child: ClipOval(
                                     //.svg
                                     child: postData[int].authorAvatarUrl!.contains(".svg") == true ?  SvgPicture.network(postData[int].authorAvatarUrl!) : Image.network(postData[int].authorAvatarUrl!),
                                   ),
                                 ),
                                 SizedBox(width: 8,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                      Text(  postData[int].authorFullName!,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                      ),
                                      // Text( "DonatedBy : " + postData[int].donatedBy.toString(),
                                      //     style: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontWeight: FontWeight.normal,
                                      //       fontSize: 11,
                                      //     ),
                                      // ),
                                   ],
                                 )
                               ],
                             ),
                              
                           
                    
                            ],
                          ),
                        ),
                      ],
                  ),
                
                ),
              ),
            ),
          );
        }
      ),
    ),
  ],
);
newpost(BuildContext context, {required  List<mainPostModel> postData, required String discover})=> Column(
  children: [
    if(boxStorage.read(Keys.token) == null)...[
       Padding(
         padding: const EdgeInsets.all(15.0),
         child: CustomButton(
           appLabel: "Sign Up & Login", 
           isLodding: RxBool(false), 
           onPressed: (){
             Get.to(()=>SiginUpView(),binding: SignUpBindings(),transition: Transition.downToUp);
             // Get.to(()=> SignUpController(),binding: SignUpBindings(), transition: Transition.leftToRight);
             print("One");
           }
         ),
       ),
    ],

    Expanded(
      child: postData.isEmpty ? SizedBox(
        child: DataNotFound(),
      ) :   ListView.builder(
        itemCount: postData.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context , int){
          return InkWell(
            onTap: (){
               Get.to(()=>ItemDetailsView(postId: postData[int].postId!,), binding: ItemDetailsBindings(), transition: Transition.rightToLeft);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postData[int].postThumbnailUrl!),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text(postData[int].postTitle!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                             ),
                             SizedBox(height: 4,),
                             Text(postData[int].postSubTitle!,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                            //  Text( "Target price : " + postData[int].targetPrice!,
                            //     style: TextStyle(
                            //       color: Colors.red,
                            //       fontWeight: FontWeight.normal,
                            //       fontSize: 15,
                            //     ),
                            //  ),
                             Text( "Post category : " + postData[int].postCategory!,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                             Row(
                               children: [
                                 CircleAvatar(
                                   backgroundColor: Colors.greenAccent,
                                   child: ClipOval(
                                     //.svg
                                     child: postData[int].authorAvatarUrl!.contains(".svg") == true ?  SvgPicture.network(postData[int].authorAvatarUrl!) : Image.network(postData[int].authorAvatarUrl!),
                                   ),
                                 ),
                                 SizedBox(width: 8,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                      Text(  postData[int].authorFullName!,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                      ),
                                      // Text( "DonatedBy : " + postData[int].donatedBy.toString(),
                                      //     style: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontWeight: FontWeight.normal,
                                      //       fontSize: 11,
                                      //     ),
                                      // ),
                                   ],
                                 )
                               ],
                             ),
                              
                            ],
                          ),
                        ),
                      ],
                  ),
                
                ),
              ),
            ),
          );
        }
      ),
    ),

 
  ],
);




populer(BuildContext context, {required  List<mainPostModel> postData, required String discover})=> Column(
    children: [
    if(boxStorage.read(Keys.token) == null)...[
       Padding(
         padding: const EdgeInsets.all(15.0),
         child: CustomButton(
           appLabel: "Sign Up & Login", 
           isLodding: RxBool(false), 
           onPressed: (){
             Get.to(()=>SiginUpView(),binding: SignUpBindings(),transition: Transition.downToUp);
             // Get.to(()=> SignUpController(),binding: SignUpBindings(), transition: Transition.leftToRight);
             print("One");
           }
         ),
       ),
    ],

   Expanded(
      child: postData.isEmpty ? SizedBox(
        child: DataNotFound(),
      ) :   ListView.builder(
        itemCount: postData.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context , int){
          return InkWell(
            onTap: (){
               Get.to(()=>ItemDetailsView(postId: postData[int].postId!,), binding: ItemDetailsBindings(), transition: Transition.rightToLeft);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postData[int].postThumbnailUrl!),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text(postData[int].postTitle!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                             ),
                             SizedBox(height: 4,),
                             Text(postData[int].postSubTitle!,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                            //  Text( "Target price : " + postData[int].targetPrice!,
                            //     style: TextStyle(
                            //       color: Colors.red,
                            //       fontWeight: FontWeight.normal,
                            //       fontSize: 15,
                            //     ),
                            //  ),
                             Text( "Post category : " + postData[int].postCategory!,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                             ),
                             Row(
                               children: [
                                 CircleAvatar(
                                   backgroundColor: Colors.greenAccent,
                                   child: ClipOval(
                                     //.svg
                                     child: postData[int].authorAvatarUrl!.contains(".svg") == true ?  SvgPicture.network(postData[int].authorAvatarUrl!) : Image.network(postData[int].authorAvatarUrl!),
                                   ),
                                 ),
                                 SizedBox(width: 8,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                      Text(  postData[int].authorFullName!,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 11,
                                          ),
                                      ),
                                      // Text( "DonatedBy : " + postData[int].donatedBy.toString(),
                                      //     style: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontWeight: FontWeight.normal,
                                      //       fontSize: 11,
                                      //     ),
                                      // ),
                                   ],
                                 )
                               ],
                             ),
                    
                            ],
                          ),
                        ),
                      ],
                  ),
                
                ),
              ),
            ),
          );
        }
      ),
    ),
  
  ],
);