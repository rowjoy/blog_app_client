// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kickapp/widget/custom_button.dart';

class DatePicker {
  static Future<dynamic> datePiker({
    BuildContext? context, 
    DateTime? initialDateTime,
    DateTime? minimumDate,
    DateTime? maximumDate,
    required int minimumYear,
    required int? maximumYear,
    required void Function(DateTime) onDateTimeChanged,
    required VoidCallback onPressed,
    }) {
    return showCupertinoModalPopup(
    barrierDismissible: false,
    context: context!,
    builder: (_) => Container(
      height:  Platform.isIOS ? 300 : 300,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 200,
            child: CupertinoDatePicker(
              minimumDate: maximumDate,
              maximumDate: maximumDate,
              mode: CupertinoDatePickerMode.date,
                minimumYear: minimumYear,
                dateOrder: DatePickerDateOrder.dmy,
                maximumYear: maximumYear,
                initialDateTime: initialDateTime,
                onDateTimeChanged: onDateTimeChanged,
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.all(Platform.isIOS ? 8.0 : 0),
            child: Row(
              children: [
                 CustomButton(
                  appLabel: "Done", 
                  isLodding: RxBool(false),
                  onPressed: (){
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: Platform.isIOS ? 25 : 0,
          ),
         ],
       ),
     ),
   );
  }
}