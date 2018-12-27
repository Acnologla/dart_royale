import './Request.dart';
import 'dart:async';
class Clans{
  String key;
  Clans(this.key);
  search({name:"",score:0,minMembers:0,maxMembers:50,locationId:""}) async{
   var _clans = await request(key, "clan/search?${name == '' ? '' : 'name='+name}&score=${score}${minMembers == 0  ? '' : '&minMembers='+minMembers.toString()}&maxMembers=${maxMembers}${locationId =='' ? '' : '&locationId='+locationId.toString()}");
   return _clans;
  }
  Future get(tag) async{
    var clan = await request(key, "clan/${tag is List ? tag.join(",") : tag }");
    if (clan is List){
      List<Clan> retorno = [];
      clan.forEach((f){
         retorno.add(new Clan(key,f));
      });
     return retorno;
    }
    else return new Clan(key,clan);
   }
}
class Clan{
 String key;
 var clan;
 Clan(this.key,this.clan);
 fetch() async{
   var war = await request(key,"clan/${clan['tag']}/war");
   var warLog =  await request(key,"clan/${clan['tag']}/warlog");
   var history =  await request(key,"clan/${clan['tag']}/history");
   var weekLog =  await request(key,"clan/${clan['tag']}/weekly");
   var battles = await request(key,"clan/${clan['tag']}/battles");
   return {
     "war":war,
     "warLog":warLog,
     "history":history,
     "weekLog":weekLog,
     "battles":battles,
     "clan":clan
   };
 }
}