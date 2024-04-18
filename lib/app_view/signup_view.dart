// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, unused_local_variable, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kickapp/app_view/login_view.dart';
import 'package:kickapp/services/bindings/login_view_bindings.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:kickapp/widget/custom_button.dart';
import 'package:kickapp/widget/custom_text_field.dart';

import '../controller/signup_controller.dart';
import '../widget/date_of_birth.dart';

class SiginUpView extends GetView<SignUpController> {
   SiginUpView({super.key});
   final formkey = GlobalKey<FormState>();
   final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("Sign Up"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
             // height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CustomTextField(
                      level: "Enter Your First Name",
                       prefixIcon: Icon(Icons.person),
                      controller: controller.firstNameController,
                      validator: (p0) => Helpers.fieldValidator(p0),
                    ),
                    SizedBox(height: 10,),
                    CustomTextField(
                      controller: controller.lastNameController,
                      level: "Enter Your Last Name",
                       prefixIcon: Icon(Icons.person),
                       validator: (p0) => Helpers.fieldValidator(p0),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        DatePicker.datePiker(
                            minimumYear: 1900,
                            context: context,
                            initialDateTime: DateTime(DateTime.now().year - 18),
                            onDateTimeChanged: (value){
                              controller.userDateOfBarth.value = value.toString();
                            },
                            maximumYear: DateTime(DateTime.now().year - 18).year,
                            onPressed: (){
                              Get.back();
                              // FocusScope.of(context).unfocus();
                            }        
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,  color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Obx(()=>Center(
                            child: controller.userDateOfBarth.value.isEmpty ? Text(" Enter your Date of birth",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ) : Text("${controller.userDateOfBarth.value}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    CustomTextField(
                      controller: controller.phoneNumberController,
                      level: "Enter Your Phone Number",
                       prefixIcon: Icon(Icons.phone),
                       validator: (p0) => Helpers.fieldValidator(p0),
                    ),
                    // SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    CustomTextField(
                      controller: controller.yourAddressController,
                      level: "Enter Your Address",
                       prefixIcon: Icon(Icons.location_city),
                       validator: (p0) => Helpers.fieldValidator(p0),
                    ),
                    SizedBox(height: 10,),
                    CustomTextField(
                      controller: controller.emailController,
                      level: "Enter Your Email",
                       prefixIcon: Icon(Icons.email),
                       validator: (p0) => Helpers.fieldValidator(p0),
                    ),
                    SizedBox(height: 10,),
                    CustomTextField(
                      controller: controller.passwordController,
                      level: "Set Your Password (6 degit)",
                       prefixIcon: Icon(Icons.password),
                       validator: (p0) => Helpers.fieldValidator(p0),
                    ),
                    
                    SizedBox(height: 10,),
                    CustomTextField(
                      controller: controller.conPasswordController,
                      level: "Confirm Your Password",
                      prefixIcon: Icon(Icons.password),
                       validator: (p0) => Helpers.fieldValidator(p0),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                         _showPicker(context);
                      },
                      child: IgnorePointer(
                        child: CustomTextField(
                          controller: controller.userProfileImageController,
                          level: "Upload Your Profile",
                          prefixIcon: Icon(Icons.upload),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Obx(()=>CustomButton(
                         appLabel: "SignUp",
                         onPressed: (){
                            if(formkey.currentState!.validate()){
                               formkey.currentState!.save();
                                controller.signUpRequest(
                                  filePath: controller.userProfileImageController.text, 
                                  email: controller.emailController.text, 
                                  password: controller.passwordController.text, 
                                  confirmPassword: controller.conPasswordController.text, 
                                  firstName: controller.firstNameController.text, 
                                  lastName: controller.lastNameController.text, 
                                  dateOfBirth: controller.userDateOfBarth.value, 
                                  phone: controller.phoneNumberController.text.replaceAll(" ", ""), 
                                  address: controller.yourAddressController.text
                                );
                            }
                           
                         }, 
                         isLodding: RxBool(controller.islodding.value),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text("Already have a account ? Login now"),
                    SizedBox(height: 15,),
                    CustomButton(
                       appLabel: "Login",
                       onPressed: (){
                         Get.to(()=> LoginView(), transition:Transition.leftToRight,binding: LoginViewBinding());
                       }, 
                       isLodding: RxBool(false)
                    ),
                    SizedBox(height: 15),
                    ExpansionTile(
                      title: Text("Forgot-password"),
                      leading: Icon(Icons.password,color: Colors.black,),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: controller.forgetPasswordController,
                                level: "Enter your email",
                                validator: (p0) => Helpers.fieldValidator(p0),
                              ),
                              SizedBox(height: 15),
                              Obx(()=> CustomButton(
                                  appLabel: "Send now", 
                                  isLodding: RxBool(controller.isLodder.value), 
                                  onPressed: (){
                                     if(controller.forgetPasswordController.text.isNotEmpty){
                                       controller.getFoget(
                                          email: controller.firstNameController.text,
                                        );
                                     }else{
                                       Helpers.fluttertoast("Enter your email");
                                     }
                                  }
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
  Future<void> _showPicker(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if(pickedFile!.path != null){
                        controller.setUserProfile(pickedFile);
                    }
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    // Handle the picked image
                    if(pickedFile!.path != null){
                        controller.setUserProfile(pickedFile);
                    }
                   
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}