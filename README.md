# dartRoyale

An easy way to get data from the royale API. 
Documentation is available at https://github.com/Acnologla/dart_royale/ 

## Usage

dartRoyale comes with 5 routes you can use: Top, Clan, Player, Popular, Tournament
To acess a route, you can use: Royale.route(key)

## Examples

```dart
import "package:dart_royale/Royale.dart";
// get a player
var royale = Royale(key);
var Players = royale.Player();
var player = await Players.get("8L9L9GL");
//  you can pass an array of tags instead, and recieve array of responses
var players = await Players.get(["LCQPVYVR","LCQPVYVR"]);
// You can get more information about player using fetch() function, it will returns Player battles, and Player Chests
var playerinfo =  await player.fetch();
var playersinfo = await players[0].fetch();

// get a clan
var Clans = royale.Clan();
var clan = await Clans.get("9PJ82CRC");
var claninfo = clan.fetch();
//like Player you can pass an array of tags too
var clansearch = await Clans.search(name:"back2future");
// params to search  name:"",score:0,minMembers:0,maxMembers:50,locationId:0
// you can get locationId in https://github.com/RoyaleAPI/cr-api-data/blob/master/json/regions.json
// you will get an array of clans, to get more info about the clan, like members you will ned to get him using tag returned
// to get war information, week information, battles information and history information you will need to use .fetch() function example:
var clan2 = await Clans.get(clansearch[0]['tag']);
var clan2info = await clan2.fetch();

//Get tops
var Tops = royale.Top();
var clantop = await Tops.get("clans");
var playerstop = await Tops.get("players");
var wartop = await Tops.get("war");
// you can get top of a region by they location_key you can get this in https://github.com/RoyaleAPI/cr-api-data/blob/master/json/regions.json example
var usclantop = await Tops.get("clans","us");

//get Populars
var Populars = royale.Popular();
var popularClans = await Populars.get("clans");
var popularPlayers = await Populars.get("players");
var popularTournaments = await Populars.get("tournaments");
var popularDecks = await Populars.get("decks");

//get tournament
var Tournaments = royale.Tournament();
var tourney = await Tournaments.get("tag");
// like clans, and players accepts an array of tags
// search tournament {joinable:0,open:0,full:0,preparation:0,thousand:0}
// 0 for inactive filter, 1 for active filter
// the filter bellow will get all tournaments that you can join, is in preparation time and is a 1000 players tournament
var tourneys = await Tournaments.search(joinable:1,open:1,full:0,preparation:1,thousand:1);
```

You can found more examples in [Here](https://github.com/Acnologla/dart_royale/example)
