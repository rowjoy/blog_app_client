// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/controller/login_controller.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:kickapp/widget/custom_text_field.dart';

import '../widget/custom_button.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        title: Text("Login Now"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: formkey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                 CustomTextField(
                   controller: controller.emailController,
                   level: "Enter your email",
                   prefixIcon: Icon(Icons.email),
                   validator: (p0) => Helpers.fieldValidator(p0),
                 ),
                 SizedBox(height: 15),
                 CustomTextField(
                   controller: controller.passwordController,
                   prefixIcon: Icon(Icons.password),
                   level: "Enter password",
                   validator: (p0) => Helpers.fieldValidator(p0),
                 ),
                 SizedBox(height: 20,),
                 Obx(()=>CustomButton(
                     isLodding: RxBool(controller.isLodder.value),
                     appLabel: "Login",
                     onPressed: (){
                        if(formkey.currentState!.validate()){
                           formkey.currentState!.save();
                            controller.loginRequest(email: controller.emailController.text, password: controller.passwordController.text);
                        }
                     },
                   ),
                 ),
              ],
            ),
          )
        ),
      ),
    );
  }
}