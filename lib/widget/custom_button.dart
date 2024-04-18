// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String appLabel;
  final RxBool isLodding;
  final  Function()? onPressed;

  const CustomButton({
    super.key,
    required this.appLabel,
    required this.isLodding,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(()=> SizedBox(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
         onPressed: isLodding.value == false ?  onPressed : null, 
         child: isLodding.value == false ?  Text(appLabel,
           style: TextStyle(
             color: Colors.white,
             fontSize: 18,
             fontWeight: FontWeight.w500,
           ),
          ) : const CircularProgressIndicator(
           strokeWidth: 1.0,
           backgroundColor: Colors.white,
         ),
         style: ElevatedButton.styleFrom(
           backgroundColor: Colors.blue,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(5),
           )
         ),
        ),
      ),
    );
  }
}