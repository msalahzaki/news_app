import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_const.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManger {

 static Future<SourceResponse> getSources()async{
   Uri url = Uri.https(ApiConst.baseURL, EndPoints.sourceApi,{
     'apiKey':ApiConst.apiKey
   });
   try{
   var response = await http.get(url);
   var json = jsonDecode(response.body);
   return SourceResponse.fromJson(json);}
       catch(e){
     throw(e);
       }
 }
}

/*
var url = Uri.https('example.com', 'whatsit/create');
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
 */