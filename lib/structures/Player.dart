import './Request.dart';
import 'dart:async';
class Players {
   String key;
   Players(this.key);
 Future get(tag) async{
    var player = await request(key, "player/${tag is List ? tag.join(",") : tag }");
    if (player is List){
      List<Player> retorno = [];
      player.forEach((f){
         retorno.add(new Player(f,key));
      });
     return retorno;
    }
    else return new Player(player,key);
   
   }
}
class Player{
  var player;
  String key;
  Player(this.player,this.key);
  Object fetch() async{
    var battles = await request(key,"player/${player['tag']}/battles");
    var chests = await request(key,"player/${player['tag']}/chests");  
    return {
      "battles":battles,
      "chests":chests,
      "player":player
    };
  }
}