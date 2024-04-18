
// ignore_for_file: unnecessary_string_interpolations, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kickapp/services/app_keys.dart';
import 'package:kickapp/services/server.dart';

import '../app_view/main_view.dart';
import '../services/bindings/main_view_bindings.dart';
import '../services/helpers.dart';


class SignUpController extends GetxController {
  var dio = Dio();
  ApiServer apiMothod = ApiServer();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController yourAddressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPasswordController = TextEditingController();
  final TextEditingController userProfileImageController = TextEditingController();
  final TextEditingController forgetPasswordController = TextEditingController();
  RxString userDateOfBarth = "".obs;
  // RxString userProfileImage = "".obs;
  var islodding = false.obs;


late List<int>imageBytesData;
late File imageFile;
Future setUserProfile (XFile file) async{
     userProfileImageController.text = file.path.split("/").last;
     imageFile = File(file.path);
  }


  Future signUpRequest ({
    required String filePath, 
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String phone,
    required String address,
    })async{
    islodding.value = true;
    var headers = {
      'X-API-Key': '{{token}}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://api.terrawhales.com/api/v1/user/signup'));
    request.fields.addAll({
      'email': '$email',
      'password': '$password',
      'confirmPassword': '$confirmPassword',
      'firstName': '$firstName',
      'lastName': '$lastName',
      'dateOfBirth': '$dateOfBirth',
      'phone': '$phone',
      'address': '$address'
    });
    //'avatar', '${filePath}'
    request.files.add(await http.MultipartFile.fromPath(
      "avatar", 
      imageFile.path,
      filename:  imageFile.path.toString().split("/").last,
      contentType: MediaType('image', 'jpg'),
     
     )
    );

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    islodding.value = false;
    print(response.statusCode);
    // "status": "success",
    if(response.statusCode == 201){
      var data = await http.Response.fromStream(response);
      var ty = jsonDecode(data.body);
      print("SigUP $ty");
      boxStorage.write(Keys.token, ty["data"]["token"]);
      boxStorage.write(Keys.userId, ty["data"]["userId"]);
      boxStorage.write(Keys.userProfile, ty["data"]["avatarUrl"]);
      boxStorage.write(Keys.userEmail, ty["data"]["email"]);
      boxStorage.write(Keys.isVerified, ty["data"]["isVerified"]);
      boxStorage.write(Keys.userName, ty["data"]["firstName"] + " " +  ty["data"]["lastName"]);
      Helpers.fluttertoast("${ty["status"]}");
      Get.to(()=> MainAppView(),binding: MainViewBindings(),transition: Transition.leftToRight);
    }else {
      var data = await http.Response.fromStream(response);
      var ty = jsonDecode(data.body);
      print(ty);
      Helpers.fluttertoast("${ty["message"]}");
    }


 }







RxBool isLodder = false.obs;
 
 Future getFoget ({required String email})async{
  isLodder.value = true;
  await apiMothod.postData(
    url: "user/forgot-password", 
    data: {
      "email": "$email"
    }
  ).then((value) {
    isLodder.value = false;
    print(value);
    Helpers.fluttertoast(value["message"]);
  });

 }





}