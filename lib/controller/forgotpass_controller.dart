// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:get/get.dart';
import 'package:kickapp/services/server.dart';

class PasswordController extends GetxController {
   ApiServer apiServer = ApiServer();

   Future forgotPassword ({required String email})async{
      await apiServer.postData(
        url: "user/forgot-password", 
        data: {
           "email": "$email"
        }
      ).then((value) {
        print(value);
      });
   }

}