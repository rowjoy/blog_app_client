

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';


class ContactUsView extends StatefulWidget {

 ContactUsView({
    Key? key, }) : super(key: key);

  @override
  State<ContactUsView> createState() => _PaymentGateWayScreenState();
}

class _PaymentGateWayScreenState extends State<ContactUsView> {
  InAppWebViewController? webView;
  double progressbar = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Contact us",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: (){
              Get.back();
            }, 
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
          ),
        ),
        
        body: Stack(
          children: [
            Builder(builder: (BuildContext context){
             return InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri("https://terrawhales.com/get-in-touch"),
                  ),
                  onLoadStop: (controller, url) {
                
                  },
                  onProgressChanged: (InAppWebViewController controller, progress) {
                      setState(() {
                          progressbar = progress / 100;
                      });
                  },
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      javaScriptCanOpenWindowsAutomatically:true
                    ),
                  ),
                  initialSettings:InAppWebViewSettings(
                    mediaPlaybackRequiresUserGesture: false,
                    useHybridComposition: true,
                    allowsInlineMediaPlayback: true,
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    
                    webView = controller;
                  }
                );
              }
            ),
            progressbar < 1.0 ? Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               child: Center(
                 child: CircularProgressIndicator(
                   strokeWidth: 2,
                   value: progressbar,
                 ),
               ),
             ) : SizedBox(),
              progressbar < 1.0 ? Container(
               child: LinearProgressIndicator(
                 valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                 value: progressbar,
               ),
             ) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
