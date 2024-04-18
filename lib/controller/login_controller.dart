// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:kickapp/services/server.dart';

import '../app_view/main_view.dart';
import '../services/app_keys.dart';
import '../services/bindings/main_view_bindings.dart';

class LoginController extends GetxController {
  ApiServer apiServer = ApiServer();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLodder = false.obs;

  Future loginRequest({required String email, required String password})async{
    isLodder.value = true;
    await apiServer.postData(
      url: "user/login", 
      data: {
          "email": "$email",
          "password": "$password"
        }
      ).then((value){
        isLodder.value = false;
        print(value);
        if(value["status"] != "error"){
          Helpers.fluttertoast(value["status"]);
          boxStorage.write(Keys.token, value["data"]["token"]);
          boxStorage.write(Keys.userId,value["data"]["userId"]);
          boxStorage.write(Keys.userName, value["data"]["name"]);
          boxStorage.write(Keys.userProfile, value["data"]["avatarUrl"]);
          boxStorage.write(Keys.userEmail, value["data"]["email"]);
          boxStorage.write(Keys.isVerified, value["data"]["isVerified"]);
          Get.to(()=> MainAppView(),binding: MainViewBindings(),transition: Transition.leftToRight);
        }else{
          Helpers.fluttertoast(value["message"]);
        }
      });
  }


}