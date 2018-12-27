import './Request.dart';
import 'dart:async';
class Tournaments{
  String key;
  Tournaments(this.key);
   Future get(tag) async{
    var tourney = await request(key, "tournament/${tag is List ? tag.join(",") : tag }");
    return tourney;
   }
  Future search({joinable:0,open:0,full:0,preparation:0,thousand:0}) async{
     var tourney = await request(key, "tourneaments/know?1k=${thousand}&open=${open}&full=${full}&inprep=${preparation}&joinable=${joinable}");
     return tourney;
   }
}