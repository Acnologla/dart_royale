library dart_royale;
import './structures/Player.dart';
import './structures/Clan.dart';
import './structures/Request.dart';
import './structures/Top.dart';
import './structures/Tournament.dart';
import './structures/Popular.dart';
class Royale{
  String key;
  Royale(this.key);
  Player(){
    return new Players(key);
  }
  Clan(){
    return new Clans(key);
  }
  Top(){
    return new Tops(key);
  }
  Tournament(){
    return new Tournaments(key);
  }
  Popular(){
    return new Populars(key);
  }
  get Constants{
     return request(key, "constants");
  }

}