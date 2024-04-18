
// ignore_for_file: empty_catches, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:kickapp/services/api_mothod.dart';
import 'package:kickapp/services/helpers.dart';




class ApiServer extends ApiMothod {
var client = http.Client();
final GetStorage box  = GetStorage();
final baseUrl = "https://api.terrawhales.com/api/v1";

@override
Future<dynamic> getData(
{
  required String url,
   required String tocken,
  })async{
    if(await InternetConnection().hasInternetAccess){
    try{
      var response = await client.get(Uri.parse("$baseUrl/$url"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $tocken",
        },
      );
      print("TTT ${response.request}");
      if(response.statusCode == 200){
        var jsonString = jsonDecode(response.body);
        return jsonString;
      }else{
        var data = jsonDecode(response.body);
        return data;
      }
    } on SocketException catch (e) {
      Helpers.fluttertoast(e.message.toString());
    } on HttpException {
    } on FormatException {
    } catch (e) {
      Helpers.fluttertoast(e.toString());
    }
    return null;
    }else{
       Helpers.fluttertoast("No internet connection".toString());
    } 

}

Future<dynamic> necgetData(
{
  required String url,
  required String tocken,
  })async{
    if(await InternetConnection().hasInternetAccess){
    try{
      var response = await client.get(Uri.parse("$baseUrl/$url"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $tocken",
        },
      );
      if(response.statusCode == 200){
        var jsonString = jsonDecode(response.body);
        return jsonString;
      }else{
        var data = jsonDecode(response.body);
        return data;
      }
    } on SocketException catch (e) {
     Helpers.fluttertoast(e.message.toString());
    } on HttpException {

    } on FormatException {

    } catch (e) {
      Helpers.fluttertoast(e.toString());
    }
    return null;
    }else{
       Helpers.fluttertoast("No internet connection".toString());
    }

}

@override
Future getSingleData(
  {
  required String url,
  required String tocken, 
  })async{
   if(await InternetConnection().hasInternetAccess){
  try{
    var response = await client.get(Uri.parse("$baseUrl/$url"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Cache-Control" : "no-cache",
        "Accept" : "*/*",
        "Connection" : "keep-alive", 
        'Authorization': "Bearer $tocken",
      },
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return jsonString;
    }else{
      var data = jsonDecode(response.body);
      return data;
    }
  } on SocketException catch (e) {
    Helpers.fluttertoast(e.message.toString());
  } on HttpException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } on FormatException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } catch (e) {

    return e;
  }

   }else{
      Helpers.fluttertoast("No internet connection".toString());
   }

}

@override
Future<dynamic> postData(
  { 
    required String url, 
    required Map<String, dynamic> data, 
    String? token
  })async{
  if(await InternetConnection().hasInternetAccess){
  try{
    var response = await client.post(Uri.parse("$baseUrl/$url"), 
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-Version': '2',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      }, 
      body: jsonEncode(data)
    );
    print(response.request);
    return jsonDecode(response.body);
  } on SocketException catch (e) {
    Helpers.fluttertoast(e.message.toString());
  } on HttpException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } on FormatException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } catch (e) {
    Helpers.fluttertoast(e.toString());
  }
  }else{
     Helpers.fluttertoast("No internet connection".toString());
  }
}



Future<dynamic> necpostData(
  { 
    required String url, 
    required Map<String, dynamic> data, 
    String? token
  })async{
   if(await InternetConnection().hasInternetAccess){
  try{
    var response = await client.post(Uri.parse("$baseUrl/$url"), 
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-Version': '2',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      }, 
      body: jsonEncode(data)
    );
    return response.body;
  } on SocketException catch (e) {
    Helpers.fluttertoast(e.message.toString());
  } on HttpException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } on FormatException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } catch (e) {
    Helpers.fluttertoast(e.toString());
  }
   }else{
     Helpers.fluttertoast("No internet connection".toString());
     return null;
   }
}


@override
Future updateData(
  { 
  required String url, 
  required Map<String, dynamic> data, 
  required String id, 
  String? token
  })async{

  try{
    var response = await client.put(Uri.parse("$baseUrl/$url/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data)
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return jsonString;
    }else{
      var errorBody = jsonDecode(response.body);
      return errorBody;
    }
  } on SocketException catch (e) {
    Helpers.fluttertoast(e.message.toString());
  } on HttpException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } on FormatException catch (error) {
     Helpers.fluttertoast(error.message.toString());
  } catch (e) {
     Helpers.fluttertoast(e.toString());
  }

}


@override
Future deleteData(
  {
    required  String url, 
    required String id
  })async{

  try{
    var response = await client.delete(Uri.parse("$baseUrl/$url/$id"));
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return jsonString;
    }else{
      var errorBody = jsonDecode(response.body);
      return errorBody;
    }
  } on SocketException catch (e) {
    Helpers.fluttertoast(e.message.toString());
  } on HttpException catch (error) {
    Helpers.fluttertoast(error.message.toString());
  } on FormatException catch (error) {
     Helpers.fluttertoast(error.message.toString());
  } catch (e) {
     Helpers.fluttertoast(e.toString());
  }

}




}





