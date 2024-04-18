

// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kickapp/app_view/contact_us_view.dart';
import 'package:kickapp/app_view/my_postview.dart';
import 'package:kickapp/app_view/post_view.dart';
import 'package:kickapp/app_view/signup_view.dart';
import 'package:kickapp/local_data/catagori_list.dart';
import 'package:kickapp/services/app_keys.dart';
import 'package:kickapp/services/bindings/app_setting_bindings.dart';
import 'package:kickapp/services/bindings/created_post_bindings.dart';
import 'package:kickapp/services/bindings/item_details_bindings.dart';
import 'package:kickapp/services/bindings/sign_up_bindings.dart';
import 'package:kickapp/services/helpers.dart';

import '../app_view/favourite_view.dart';
import '../app_view/setting_view.dart';
import '../controller/main_view_controller.dart';

mainDrawer(BuildContext context, MainViewController  mainViewController) =>  Drawer(
   child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
             // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                boxStorage.read(Keys.token) == null ? SizedBox(
                  child: ListTile(
                    onTap: (){
                       Get.to(()=> SiginUpView(), transition: Transition.leftToRight,binding: SignUpBindings());
                    },
                    leading: Icon(Icons.person,color: Colors.black,),
                    title: Text("Sign up & login"),
                  ),
                ) :  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: ClipOval(
                            child: boxStorage.read(Keys.userProfile).toString().contains(".svg") == true ? SvgPicture.network(
                              boxStorage.read(Keys.userProfile),
                              fit: BoxFit.cover,
                              width: 100,
                            ) : Image.network(boxStorage.read(Keys.userProfile)),
                          ),
                        // backgroundImage: Image.memory(bytes),
                      ),
                      Text("${boxStorage.read(Keys.userName)}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            onTap: (){
                               boxStorage.remove(Keys.tempPostId);
                                //if(boxStorage.read(Keys.isVerified).toString() == "true"){
                               Get.to(()=> PostView(),binding: CreatedPostBindings(),transition:Transition.leftToRight,arguments: true);
                               //}else {
                                // Helpers.fluttertoast("Please verified your email");
                              // }
                            },
                            title: Text("Created Post"),
                            leading: Icon(Icons.post_add,color: Colors.black,),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            onTap: (){
                              if(boxStorage.read(Keys.token) != null){
                                 
                                 Get.to(()=> MyPostView(),binding: CreatedPostBindings(), transition: Transition.leftToRight, arguments: false);
                              }else {
                                 Helpers.fluttertoast("Login now . Then acess your post");
                                 Get.to(()=> SiginUpView(), transition: Transition.leftToRight,binding: SignUpBindings());
                              }
                             
                            },
                            title: Text("My Post"),
                            leading: Icon(Icons.my_library_books,color: Colors.black,),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            onTap: (){
                              if(boxStorage.read(Keys.token) != null){
                                 Get.to(()=> FavouriteView(), binding: ItemDetailsBindings(), transition: Transition.leftToRight,);
                              }else {
                                 Helpers.fluttertoast("Login now . Then acess your favourite post");
                                 Get.to(()=> SiginUpView(), transition: Transition.leftToRight,binding: SignUpBindings());
                              }
                              
                            },
                            title: Text("Favourite"),
                            leading: Icon(Icons.favorite,color: Colors.black,),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                           ListTile(
                            onTap: (){
                              Get.to(()=> AppSetting(), binding: AppSettingBindings(), transition: Transition.leftToRight);
                            },
                            title: Text("Setting"),
                            leading: Icon(Icons.settings,color: Colors.black,),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          // ListTile(
                          //   title: Text("Change Password"),
                          // ),
                          // ListTile(
                          //   onTap: (){
                             
                          //   },
                          //   title: Text("Log Out"),
                          // ),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                 // Text("Catagory type"),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int){
                      return Obx(()=> ListTile(
                           onTap: (){
                              mainViewController.categoryData.value = categoryList[int].toString();
                              mainViewController.getpostWithCatagory();
                              Get.back();
                           },
                           title:  Text(categoryList[int].toString(),),
                           titleTextStyle: TextStyle(
                             color:  mainViewController.categoryData.value ==  categoryList[int].toString() ? Colors.blue : Colors.black,
                             fontWeight: mainViewController.categoryData.value ==  categoryList[int].toString() ? FontWeight.bold : FontWeight.w400,
                             fontSize: mainViewController.categoryData.value ==  categoryList[int].toString() ? 20 : 18,
                           ),
                        ),
                      );
                    }
                  ),
                  TextButton(
                    onPressed: (){
                      Get.to(()=>ContactUsView());
                     // Get.back();
                    }, 
                    child: Text("Contact us")
                  ),
                ],
              ),
          ),
        ),
    ),
);