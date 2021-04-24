import 'package:crypto_monitor/models/bottom_navbar.dart';
import 'package:crypto_monitor/screens/no_internet_connection_screen.dart';
import 'package:crypto_monitor/screens/price_reader.dart';
import 'package:flutter/material.dart';
import 'package:crypto_monitor/models/coin_row.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';


class WatchlistScreen extends StatefulWidget {
  static const String id = 'Watchlist';

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {

  bool _loading = false;
  Future<List> _future;

  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  var _connectionStatus = "Unknown";
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;


  Future<void> _getCoinListData() async {
    setState(() {
      fetchCoinListPageFeed();
    });
  }


  Future<void> fetchCoinListPageFeed() async{
    _loading = true;
    setState(() {
      _loading = false;
      _future = getCryptoCurrenciesInfo();
    });
    return _future;
  }

  Future<List> getCryptoCurrenciesInfo() async {

    PriceReader price = new PriceReader();
    var priceData = await price.getData();
    return priceData;
  }


  @override
  void initState(){
    () async {
      fetchCoinListPageFeed();
      //_future = getCryptoCurrenciesInfo();
    }();
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result){
          _connectionStatus = result.toString();
          if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile){
            //     () async {
            //   fetchCoinListPageFeed();
            //   //_future = getCryptoCurrenciesInfo();
            // }();
          }
          else{
             // print("No internet connection available");
              NoInternetConnectionWidget(onPressed: (){fetchCoinListPageFeed();}
              );
          }
    });

  }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   switch (result) {
  //     case ConnectivityResult.wifi:
  //     case ConnectivityResult.mobile:
  //     case ConnectivityResult.none:
  //       setState(() => _connectionStatus = result.toString());
  //       break;
  //     default:
  //       setState(() => _connectionStatus = 'Failed to get connectivity.');
  //       break;
  //   }
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      //updateListView();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: Color(0xffffffff),
      body: RefreshIndicator(
        onRefresh: _getCoinListData,
        child: (_loading == true)?
        Center(child: Container(child: CircularProgressIndicator(backgroundColor: Colors.lightGreen,))):
        FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot<List> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('none');
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    // return Text(
                    //   '${snapshot.error}',
                    //   style: TextStyle(color: Colors.red),
                    // );
                    print("Error comes from here - snapshot");
                    return NoInternetConnectionWidget(onPressed: (){fetchCoinListPageFeed();});
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return CoinRow(id: snapshot.data[index]['id'],
                              coinName: snapshot.data[index]['name'],
                              coinSymbol: snapshot.data[index]['symbol'],
                              cmcRank: snapshot.data[index]['cmc_rank'],
                            price: snapshot.data[index]['quote']['USD']['price'],
                            marketCap: snapshot.data[index]['quote']['USD']['market_cap'],
                            percentChange_24h: snapshot.data[index]['quote']['USD']['percent_change_24h'],
                          );
                        },
                    );
                  }
              }
              return Container();
            },
        ),
      ),
    );
  }
  }