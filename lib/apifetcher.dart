import 'package:http/http.dart' as http;
import 'auctionview.dart';
import 'dart:convert';

Future getAuctionData() async {
  var response =
      await http.get(Uri.https('api.hypixel.net', 'skyblock/auction', {
    'player': '5d526145-841f-4d10-9f14-715b89dfa629',
    'key': const String.fromEnvironment('HYPIXEL_API_KEY')
  }));
  List<AuctionWidget> activeAuctions = [];
  List<AuctionWidget> endedAuctions = [];
  var jsonData = jsonDecode(response.body);
  if (jsonData['success'] == false) {
    print(jsonData["cause"]);
  }
  print(jsonData);
  for (var auction in jsonData["auctions"]) {
    if (DateTime.now().millisecondsSinceEpoch - auction["end"] >= 0) {
      activeAuctions.add(AuctionWidget(
        name: auction["item_name"],
        isBIN: auction["bin"] != "false",
        price: auction["starting_bid"].toString(),
        isActive: true,
        auctionUUID: auction["uuid"],
      ));
    } else {
      endedAuctions.add(AuctionWidget(
        name: auction["item_name"],
        isBIN: auction["bin"] != "false",
        price: auction["starting_bid"],
        isActive: false,
        auctionUUID: auction["uuid"],
      ));
    }
  }
  return {"activeAuctions": activeAuctions, "endedAuctions": endedAuctions};
}
