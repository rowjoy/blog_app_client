abstract class ApiMothod {
Future<dynamic> getData({
  required String url,
   required String tocken,
  }); 
Future<dynamic> getSingleData({
  required String url,
  required String tocken,
  });
Future<dynamic> postData({
  required String url,required Map<String, dynamic> data, });
Future<dynamic> updateData({ 
  required String url, 
  required Map<String, dynamic> data, 
  required String id, 
  String? token
  });
Future<dynamic> deleteData(  { 
    required  String url, 
    required String id
  });
}