// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
    static fluttertoast (String message){
    Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


static keyboardhide (){
  return  FocusManager.instance.primaryFocus?.unfocus();
}

  static  fieldValidator (value ){
    if(value!.isEmpty){
      return "Required this field";
    }else{
      return null;
    }
  }

  static clipBoard({required String data , BuildContext? context} ){
  Clipboard.setData(new ClipboardData(text: data));
    Fluttertoast.showToast(
      msg: "Copyed! & Share Now",
    );
}
}