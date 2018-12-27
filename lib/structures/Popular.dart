import './Request.dart';
import 'dart:async';
class Populars{
  String key;
  Populars(this.key);
  Future get (String option) async{
    var popular = await request(key, "popular/${option}");
    return popular;   
  }
}