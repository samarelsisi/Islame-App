import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:project/models/RadioResponse.dart';

class ApiManager{
   static Future<RadioResponse> getRadioData()async{
 try{
   Uri url=Uri.parse("https://mp3quran.net/api/v3/radios");
   var response=await http.get(url);
   var jsonResponse=jsonDecode(response.body);
   return RadioResponse.fromJson(jsonResponse);

 }
 catch(e){
  throw e;
 }
}
}