// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kickapp/services/server.dart';

class ResendVerificationController extends GetxController {
  ApiServer apiServer = ApiServer();

  Future resendVarification ({required String email})async{
    await apiServer.postData(
       url: "user/resend-verification-email",
       data: {
          "email": "$email"
       }
      ).then((value){
        print(value);
      });
  }

}