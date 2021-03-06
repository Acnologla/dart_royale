# dartRoyale

An easy way to get data from the royale API. <br>
Documentation is available at https://docs.royaleapi.com/<br>
PUB: https://pub.dartlang.org/packages/dart_royale

## Usage

dartRoyale comes with 5 routes you can use: Top, Clan, Player, Popular, Tournament<br>
To acess a route, you can use: Royale(apiKey).route()<br>
You can get a key [Here](https://docs.royaleapi.com/#/authentication)

```dart
import "package:dart_royale/Royale.dart";
var royale = Royale(apiKey);
```

<br>
<h1> Player Router </h1>

```dart
// get a player
var Players = royale.Player();
var player = await Players.get("8L9L9GL");
//  you can pass an array of tags instead, and recieve array of responses
var players = await Players.get(["LCQPVYVR","LCQPVYVR"]);
print(player.player); // this return basic player information
//if you have an array you can do:
print(player[0].player);
// You can get more information about player using fetch() function, it will returns Player battles, and Player Chests
var playerinfo =  await player.fetch();
var playersinfo = await players[0].fetch();
```

<br>
<h1> Clan Router </h1>

```dart
// get a clan
var Clans = royale.Clan();
var clan = await Clans.get("9PJ82CRC");
print (clan.clan); //this return clan information and like player you can do:
var clans = await Clans.get(["9PJ82CRC","9PJ82CRC"]);
print(clan[0].clan);
var claninfo = clan.fetch();
var clansearch = await Clans.search(name:"back2future");
// params to search  name:"",score:0,minMembers:0,maxMembers:50,locationId:0
// you can get locationId in https://github.com/RoyaleAPI/cr-api-data/blob/master/json/regions.json
// you will get an array of clans, to get more info about the clan, like members you will ned to get him using tag returned
// to get war information, week information, battles information and history information you will need to use .fetch() function example:
var clan2 = await Clans.get(clansearch[0]['tag']);
var clan2info = await clan2.fetch();
```

<br>
<h1> Top Router</h1>

```dart
//Get tops
var Tops = royale.Top();
var clantop = await Tops.get("clans");
var playerstop = await Tops.get("players");
var wartop = await Tops.get("war");
// you can get top of a region by they location_key you can get this in https://github.com/RoyaleAPI/cr-api-data/blob/master/json/regions.json, example:
var usclantop = await Tops.get("clans","us");
```

<br>
<h1> Popular Router </h1>

```dart
//get Populars
var Populars = royale.Popular();
var popularClans = await Populars.get("clans");
var popularPlayers = await Populars.get("players");
var popularTournaments = await Populars.get("tournaments");
var popularDecks = await Populars.get("decks");
```

<br>
<h1> Tournament Router </h1>

```dart
//get tournament
var Tournaments = royale.Tournament();
var tourney = await Tournaments.get("tag");
// like clans, and players accepts an array of tags
// search tournament {joinable:0,open:0,full:0,preparation:0,thousand:0}
// 0 for inactive filter, 1 for active filter
// the filter bellow will get all tournaments that you can join, is in preparation time and is a 1000 players tournament
var tourneys = await Tournaments.search(joinable:1,open:1,full:0,preparation:1,thousand:1);
```

You can found more examples in [Here](https://github.com/Acnologla/dart_royale/tree/master/example)
