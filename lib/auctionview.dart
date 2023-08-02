import 'package:flutter/material.dart';
import 'apifetcher.dart';

class AuctionsView extends StatefulWidget {
  const AuctionsView({
    super.key,
  });

  @override
  State<AuctionsView> createState() => _AuctionsViewState();
}

class _AuctionsViewState extends State<AuctionsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAuctionData(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text("Loading..."),
          );
        } else {
          return ListView(
            children: [
              snapshot.data['activeAuctions'],
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),
              Center(
                child: Text("Past Auctions",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              snapshot.data['endedAuctions']
            ],
          );
        }
      },
    );
  }
}

class AuctionWidget extends StatelessWidget {
  const AuctionWidget(
      {super.key,
      required this.name,
      required this.isBIN,
      required this.price,
      required this.isActive,
      required this.auctionUUID});

  final String name;
  final bool isBIN;
  final String price;
  final bool isActive;
  final String auctionUUID;

  final activeText = const Text("Active",
      style: TextStyle(
          fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold));

  final inactiveText = const Text("Ended",
      style: TextStyle(
          fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 23),
              ),
              Text(
                isBIN ? "BIN" : "Auction",
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 20),
              ),
              isActive ? activeText : inactiveText
            ],
          ),
        ),
      ),
    );
  }
}
