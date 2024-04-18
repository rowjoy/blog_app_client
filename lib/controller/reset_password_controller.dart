// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, avoid_print

import 'package:get/get.dart';
import 'package:kickapp/services/server.dart';

class ResetPasswordController extends GetxController {

  ApiServer apiServer = ApiServer();

  Future resetPassword ({required String JWT_TOKEN, required String password, required String confirmPassword})async{
    await apiServer.postData(
       url:"user/reset-password", 
       data: 
         {
          "resetToken": "$JWT_TOKEN",
          "password": "$password",
          "confirmPassword": "$confirmPassword"
         }
    ).then((value) {
       print(value);
    });
  }

}