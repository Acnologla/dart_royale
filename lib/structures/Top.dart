import './Request.dart';
import 'dart:async';
class Tops{
  String key;
  Tops(this.key);
  Future get(String option,[location]) async{
    var top = await request(key, "top/${option}${location != null ? '/'+location : ''}");
    return top;
  }
}