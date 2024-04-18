// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kickapp/services/app_keys.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:kickapp/widget/custom_button.dart';
import 'package:kickapp/widget/custom_text_field.dart';

import '../controller/new_postcontroller.dart';
import '../local_data/catagori_list.dart';

class PostView extends GetView<CreatedPostController> {
 PostView({super.key});
  final ImagePicker _picker = ImagePicker();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if(Get.arguments.toString() == "true"){
       Future.delayed(Duration(milliseconds: 100),(){
          controller.cashClear();
          if( boxStorage.remove(Keys.tempPostId) != null){
              boxStorage.remove(Keys.tempPostId);
          }
       });
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("Created new post"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        leading: IconButton(onPressed: (){
          Get.back();
          
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        
      ),
      ),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("Basic Info Section",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       SizedBox(height: 15,),
                       InkWell(
                         onTap: (){
                           _showPicker(Get.context!);
                         },
                         child: IgnorePointer(
                           child: CustomTextField(
                             controller: controller.filePath,
                             prefixIcon: Icon(Icons.file_upload),
                             level: "Upload post thumbnail",
                             validator: (p0) => Helpers.fieldValidator(p0),
                           ),
                         ),
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.postTitle,
                         level: "Post Title",
                         validator: (p0) => Helpers.fieldValidator(p0),
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.postSubTitle,
                         level: "Post Subtittle",
                         validator: (p0) => Helpers.fieldValidator(p0),
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.postOriginCountry,
                         //controller: controller.,
                         level: "State & Country",
                         validator: (p0) => Helpers.fieldValidator(p0),
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.postContent,
                         level: "Short OverView",
                         validator: (p0) => Helpers.fieldValidator(p0),
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         level: "Expected Investment(Number)",
                         controller: controller.targetPrice,
                         keyboardType: TextInputType.number,
                         validator: (p0) => Helpers.fieldValidator(p0),
                         maxLines: 1,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.targetEquity,
                         level: "Equity Offered(Number%)",
                         maxLines: 1,
                         validator: (p0) => Helpers.fieldValidator(p0),
                       ),
                       SizedBox(height: 10,),
                       Center(
                         child: Obx(()=> DropdownButtonFormField<String>(
                            value: controller.selectCatagory.value,
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder()
                            ),
                            validator:(e)=>Helpers.fieldValidator(e),
                            hint: Text("Select Category"),
                            items: categorydropDown.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.selectCatagory.value = value!;
                              print(value);
                            },
                          ),
                         ),
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.postUrl,
                         level: "Viedeo Url (Youtube/Vimeo)",
                         maxLines: 1,
                         validator: (p0) => Helpers.fieldValidator(p0),
                       ),
                       SizedBox(height: 15,),
                       Text("About Bussiness section",
                         style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       Text("What does your company do or what is your product?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         level: "Your Answer",
                         controller: controller.aboutProduct1,
                         validator: (p0) => Helpers.fieldValidator(p0),
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("What problem does your product or service solve?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutProduct2,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("What is unique or innovative about your product or service?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutProduct3,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("Do you have a patent or any intellectual property protection?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutProduct4,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("Market and Customer",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       SizedBox(height: 15,),
                       Text("Who is your target market?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutMarket1,
                         level: "Your Answer",
                         validator: (p0) => Helpers.fieldValidator(p0),
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("How big is the market for your product or service?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutMarket2,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("How have customers responded to your product so far?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutMarket3,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("What is your customer acquisition cost?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutMarket4,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("Sales and Financials",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       SizedBox(height: 15,),
                       Text("What are your sales to date?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutSales1,
                         level: "Your Answer",
                         validator: (p0) => Helpers.fieldValidator(p0),
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("What are your projected sales for the next year?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutSales2,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("What is your revenue model or how do you make money?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutSales3,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("What are your margins?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutSales4,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("Business Model and Strategy",
                         style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       SizedBox(height: 15,),
                       Text("How do you plan to scale your business?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.businessPlan1,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("What is your marketing and sales strategy?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.businessPlan2,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("Who are your competitors and how do you differentiate from them?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.businessPlan3,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("Have you faced any significant challenges, and how have you overcome them?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.businessPlan4,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 15,),
                       Text("Team",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       SizedBox(height: 15,),
                       Text("Who is on your team and what are their roles?"),
                       SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutTeam1,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("What experience does your team have in this industry?"),
                        SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutTeam2,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("How committed is the team to the success of the business?"),
                        SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.aboutTeam3,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                      //  CustomTextField(
                      //    controller: controller.aboutTeam4,
                      //    level: "Your Answer",
                      //    maxLines: 3,
                      //  ),
                       SizedBox(height: 10,),
                       Text("Future Plans",
                         style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       SizedBox(height: 15,),
                       Text("Where do you see your company in the next 5 years?"),
                        SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.futurePlan1,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("Do you have plans for future products or services?"),
                        SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.futurePlan2,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       SizedBox(height: 10,),
                       Text("What is your exit strategy?"),
                        SizedBox(height: 8,),
                       CustomTextField(
                         controller: controller.futurePlan3,
                         level: "Your Answer",
                         maxLines: 3,
                       ),
                       //SizedBox(height: 15,),
                      //  CustomTextField(
                      //    controller: controller.futurePlan4,
                      //    level: "Your Answer",
                      //    maxLines: 3,
                      //  ),
                       SizedBox(height: 15,),
                       Text("FAQ",
                         style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faq1,
                         level: "Write quistion on 1",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faqA1,
                         level: "Write Answer on 1",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faq2,
                         level: "Write quistion on 2",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faqA2,
                         level: "Write Answer on 2",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faq3,
                         level: "Write quistion on 3",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faqA3,
                         level: "Write Answer on 3",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faq4,
                         level: "Write quistion on 4",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faqA4,
                         level: "Write Answer on 4",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faq5,
                         level: "Write quistion on 5",
                         maxLines: 2,
                       ),
                       SizedBox(height: 10,),
                       CustomTextField(
                         controller: controller.faqA5,
                         level: "Write Answer on 5",
                         maxLines: 2,
                       ),
                       SizedBox(height: 15,),
                       Obx(()=> CustomButton(
                          appLabel: "Post Now", 
                          isLodding: RxBool(controller.ispostLodder.value), 
                          onPressed: (){
                             if(formkey.currentState!.validate()){
                                formkey.currentState!.save();
                                if(Get.arguments.toString() != "Update"){
                                   controller.createdpostRequest();
                                }else {
                                   controller.updatePost(postId: boxStorage.read(Keys.tempPostId));
                                }
                               
                             }
                          }
                        ),
                       ),
                    ],
                  ),
                ),
              ),
            )
          );
        
        
        }
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