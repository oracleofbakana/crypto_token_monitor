import 'package:flutter/material.dart';
import 'package:crypto_monitor/screens/watchlist.dart';
import 'package:crypto_monitor/screens/portfolio.dart';
import 'package:crypto_monitor/screens/home_screen.dart';
import 'package:crypto_monitor/screens/discover.dart';
// import 'package:crypto_monitor/screens/no_internet_connection_screen.dart';


void main() {
  runApp(CryptoMonitor());
}

class CryptoMonitor extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Assets Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.id,
      routes:
      {
        HomeScreen.id: (context)=>HomeScreen(),
        WatchlistScreen.id: (context)=>WatchlistScreen(),
        PortfolioScreen.id: (context)=>PortfolioScreen(),
        DiscoverNewsPage.id: (context)=> DiscoverNewsPage(),
        //NoInternetConnectionWidget.id: (context)=> NoInternetConnectionWidget(),
      },
    );
  }
}
