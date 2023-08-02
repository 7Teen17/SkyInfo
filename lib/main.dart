import 'auctionview.dart';
import 'settingsview.dart';
import 'package:flutter/material.dart';
import 'apifetcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        floatingActionButton: currentPageIndex != 2
            ? const FloatingActionButton(
                onPressed: getAuctionData,
                backgroundColor: Colors.lightGreen,
                child: Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
              )
            : null,
        appBar: AppBar(
          title: Text("SkyInfo",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: const [
          AuctionsView(),
          NetworthView(),
          SettingsView()
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.gavel),
              label: 'Auctions',
            ),
            NavigationDestination(
              icon: Icon(Icons.money),
              label: 'Networth',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class Placeholderlistviewwidgetomg extends StatelessWidget {
  const Placeholderlistviewwidgetomg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AuctionWidget(
          name: "Heroic Hyperion",
          isBIN: true,
          price: "2.386B Coins",
          isActive: true,
          auctionUUID: "",
        ),
        const AuctionWidget(
          name: "Withered Flower of Truth",
          isBIN: false,
          price: "13.38M Coins",
          isActive: false,
          auctionUUID: "",
        ),
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
        const AuctionWidget(
          name: "Withered Flower of Truth",
          isBIN: false,
          price: "13.38M Coins",
          isActive: false,
          auctionUUID: "",
        ),
      ],
    );
  }
}

class NetworthView extends StatelessWidget {
  const NetworthView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
