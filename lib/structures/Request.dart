import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
Future request(String key,String endpoint) async{
  var a = await http.get( 
    "https://api.royaleapi.com/${endpoint}",
    headers: {"auth": key},
  );
  return  jsonDecode(a.body);
  }