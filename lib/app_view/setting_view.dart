// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/app_view/main_view.dart';
import 'package:kickapp/controller/app_setting_controller.dart';
import 'package:kickapp/services/app_keys.dart';
import 'package:kickapp/services/bindings/main_view_bindings.dart';
import 'package:kickapp/widget/custom_button.dart';

class AppSetting extends GetView<AppSettingController> {
   AppSetting({super.key});

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title: Text("App Setting"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SafeArea(
          child: Column(
            children: [
              // ListTile(
              //   title: Text("Verification email"),
              //   leading: Icon(Icons.email,color: Colors.black,),
              //   //trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
              // ),
              ExpansionTile(
                title:  Text( boxStorage.read(Keys.isVerified).toString() == "true" ? "Verification complete" : "Verification email"),
                leading: Icon(Icons.verified, color: boxStorage.read(Keys.isVerified).toString() == "true" ? Colors.blue : Colors.red,),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          // CustomTextField(
                          //   controller: controller.textEditingController,
                          //   level: "Enter your email",
                          //   validator: (p0) => Helpers.fieldValidator(p0),
                          // ),
                          //SizedBox(height: 15,),
                          Obx(()=>  CustomButton(
                              appLabel: boxStorage.read(Keys.isVerified).toString() == "false" ? "Send email" : "Is verified", 
                              isLodding: RxBool(controller.isLodder.value), 
                              onPressed: boxStorage.read(Keys.isVerified).toString() == "true" ? null : (){
                                 if(globalKey.currentState!.validate()){
                                   globalKey.currentState!.save();
                                   controller.verifyEmail(email: boxStorage.read(Keys.userEmail));
                                 }
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              ListTile(
                title: Text("Log out"),
                onTap: (){
                   boxStorage.remove(Keys.token);
                   boxStorage.remove(Keys.userId);
                   Get.off(()=>MainAppView(),binding: MainViewBindings(),transition: Transition.leftToRight);
                },
                leading: Icon(Icons.logout,color: Colors.black,),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
              )
            ],
          )
        ),
      ),
    );
  }
}