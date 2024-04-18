// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../app_model/post_details_model.dart';

aboutBussiness(BuildContext context, AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
          /*
          What does your company do or what is your product?
          What problem does your product or service solve?
          What is unique or innovative about your product or service?
          Do you have a patent or any intellectual property protection?
           */
     
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            title: Text("What does your company do or what is your product ?",
              style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
              ),
            ),
            children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("${snapshot.data!.aboutProduct1}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
               ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            title: Text("What problem does your product or service solve ?",
              style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
              ),
            ),
            children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("${snapshot.data!.aboutProduct2}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
               ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            title: Text("What is unique or innovative about your product or service ?",
              style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
              ),
            ),
            children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("${snapshot.data!.aboutProduct3}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
               ),
            ],
          ),
          // ExpansionTile(
          //   title: Text("Do you have a patent or any intellectual property protection ?"),
          //   children: [
          //      Text("${snapshot.data!.aboutProduct4}"),
          //   ],
          // ),
           CustomExpansion(
             title: "Do you have a patent or any intellectual property protection ?",
             subTitle:"${snapshot.data!.aboutProduct4}",
           ),
           
       ],
     ),
  ),
);




targetMarket(BuildContext context, AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            CustomExpansion(
              title: "Who is your target market ?", 
              subTitle: snapshot.data!.aboutMarket1.toString(),
            ),
            CustomExpansion(
              title: "How big is the market for your product or service ?", 
              subTitle: snapshot.data!.aboutMarket2.toString(),
            ),
            CustomExpansion(
              title: "How have customers responded to your product so far ?", 
              subTitle: snapshot.data!.aboutMarket3.toString(),
            ),
            // ExpansionTile(
            //   title: Text("What is your customer acquisition cost ?")
            // ),
            CustomExpansion(
              title: "What is your customer acquisition cost ?", 
              subTitle: snapshot.data!.aboutMarket4.toString(),
            ),
         ],
       ),
     ),
  ),
);



salesMarket(BuildContext context,AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     /*
     
  How do you plan to scale your business?
  What is your marketing and sales strategy?
  Who are your competitors and how do you differentiate from them?
  Have you faced any significant challenges, and how have you overcome them?
     
      */
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            CustomExpansion(
              title: "What are your sales to date?", 
              subTitle: snapshot.data!.aboutSales1.toString(),
            ),
            CustomExpansion(
              title: "What are your projected sales for the next year?", 
              subTitle: snapshot.data!.aboutSales2.toString(),
            ),
            CustomExpansion(
              title: "What is your revenue model or how do you make money?", 
              subTitle: snapshot.data!.aboutSales3.toString(),
            ),
            CustomExpansion(
              title: "What are your margins?", 
              subTitle: snapshot.data!.aboutSales4.toString(),
            ),
         ],
       ),
     ),
  ),
);


modelandStrategy(BuildContext context,AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     /*
     
  Who is on your team and what are their roles?
  What experience does your team have in this industry?
  How committed is the team to the success of the business?
     
      */
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            // ExpansionTile(
            //   title: Text("How do you plan to scale your business?")
            // ),
            CustomExpansion(
              title: "How do you plan to scale your business?", 
              subTitle: snapshot.data!.businessPlan1.toString(),
            ),
            // ExpansionTile(
            //   title: Text("What is your marketing and sales strategy?")
            // ),
            CustomExpansion(
              title: "What is your marketing and sales strategy?", 
              subTitle: snapshot.data!.businessPlan2.toString(),
            ),
            // ExpansionTile(
            //   title: Text("Who are your competitors and how do you differentiate from them?")
            // ),
            CustomExpansion(
              title: "Who are your competitors and how do you differentiate from them?", 
              subTitle: snapshot.data!.businessPlan3.toString(),
            ),
            // ExpansionTile(
            //   title: Text("Have you faced any significant challenges, and how have you overcome them?")
            // ),
            CustomExpansion(
              title: "Have you faced any significant challenges, and how have you overcome them ?", 
              subTitle: snapshot.data!.businessPlan4.toString(),
            ),
         ],
       ),
     ),
  ),
);



teamRoles(BuildContext context,AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     /*
     
  
  Future Plans:---
  
  Where do you see your company in the next 5 years?
  Do you have plans for future products or services?
  What is your exit strategy?
     
      */
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            // ExpansionTile(
            //   title: Text("Who is on your team and what are their roles?")
            // ),
            CustomExpansion(
              title: "Who is on your team and what are their roles?", 
              subTitle: snapshot.data!.aboutTeam1.toString(),
            ),
            // ExpansionTile(
            //   title: Text("What experience does your team have in this industry?")
            // ),
            CustomExpansion(
              title: "What experience does your team have in this industry?", 
              subTitle: snapshot.data!.aboutTeam2.toString(),
            ),
            // ExpansionTile(
            //   title: Text("How committed is the team to the success of the business?")
            // ),
            CustomExpansion(
              title: "How committed is the team to the success of the business?", 
              subTitle: snapshot.data!.aboutTeam3.toString(),
            ),
         ],
       ),
     ),
  ),
);


futurePlans(BuildContext context,AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            // ExpansionTile(
            //   title: Text("Where do you see your company in the next 5 years?")
            // ),
            CustomExpansion(
              title: "Where do you see your company in the next 5 years?", 
              subTitle: snapshot.data!.futurePlan1.toString(),
            ),
            // ExpansionTile(
            //   title: Text("Do you have plans for future products or services?")
            // ),
            CustomExpansion(
              title: "Do you have plans for future products or services", 
              subTitle: snapshot.data!.futurePlan2.toString(),
            ),
            // ExpansionTile(
            //   title: Text("What is your exit strategy?")
            // ),
            CustomExpansion(
              title: "What is your exit strategy?", 
              subTitle: snapshot.data!.futurePlan3.toString(),
            ),
         ],
       ),
     ),
  ),
);

faQ(BuildContext context,AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            // Text("5 question and 5 answer")
             CustomExpansion(
              title: snapshot.data!.faq1.toString(), 
              subTitle: snapshot.data!.faqA1.toString(),
            ),
            CustomExpansion(
              title: snapshot.data!.faq2.toString(), 
              subTitle: snapshot.data!.faqA2.toString(),
            ),
            CustomExpansion(
              title: snapshot.data!.faq3.toString(), 
              subTitle: snapshot.data!.faqA3.toString(),
            ),
            CustomExpansion(
              title: snapshot.data!.faq4.toString(), 
              subTitle: snapshot.data!.faqA4.toString(),
            ),
         ],
       ),
     ),
  ),
);

investmentandValuation(BuildContext context,AsyncSnapshot<PostDetailsModel> snapshot)=> SingleChildScrollView(
  child: Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     decoration: BoxDecoration(),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            CustomExpansion(
              title: snapshot.data!.investmentPlan1.toString(), 
              subTitle: snapshot.data!.investmentPlan1.toString(),
            ),
         ],
       ),
     ),
  ),
);





class CustomExpansion extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomExpansion({
    super.key,
    required this.title,
    required this.subTitle,

  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
     expandedCrossAxisAlignment: CrossAxisAlignment.start,
     expandedAlignment: Alignment.topLeft,
     title: Text(title,
       style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
       ),
     ),
     children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subTitle,
             style: TextStyle(
               color: Colors.black,
               fontSize: 15,
               fontWeight: FontWeight.normal,
             ),
           ),
        ),
     ],
   );
  }
}