import 'package:crypto_monitor/models/news_card.dart';
import 'package:crypto_monitor/models/sections.dart';
import 'package:crypto_monitor/screens/portfolio.dart';
import 'package:crypto_monitor/services/feed_reader.dart';
import 'package:flutter/material.dart';
import 'package:crypto_monitor/models/crypto_monitor_appbar.dart';
import 'package:crypto_monitor/models/bottom_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crypto_monitor/models/category_cards.dart';
import 'package:flutter/rendering.dart';
import 'package:crypto_monitor/models/coin_cards.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double topContainer = 0;
  bool _loading = false;

  List<Widget> itemsData = [];

  final List<Icon> faIcons = [
    Icon(FontAwesomeIcons.user),
    Icon(FontAwesomeIcons.shieldAlt),
    Icon(FontAwesomeIcons.exchangeAlt),
    Icon(FontAwesomeIcons.eye),
  ];

  final List<String> menuText = [
    'Price Alerts',
    'Compare',
    'Convert',
    'WatchList'
  ];

  final List<Color> colorCodes = [
    Color(0xff21defb),
    Color(0xfff859ae),
    Color(0xff3761f6),
    Color(0xff8a3efd)
  ];

  List _news = [];

  @override
  void initState(){
        () async {
          fetchHomePageNewsFeed();
    } ();
    super.initState();
  }

  void fetchHomePageNewsFeed() async{
    _loading = true;
    FeedReader feed = new FeedReader();
    var feedData = await feed.getData();

    setState(() {
      _loading = false;
      _news = feedData['results'];
    });
  }

  Future<void> _getNewsFeedData() async {
    setState(() {
      fetchHomePageNewsFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    //int index = 0;

    return Scaffold(
      appBar: CryptoMonitorAppBar(),
      backgroundColor: Color(0xfff4f4f4),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child:Container(
            height: _height * 1.7,
            child: Stack(
              children: <Widget>[
                Positioned(
                  //left: _width * 0.05,
                  child:  GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    childAspectRatio: 12 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.generate(4, (index) {
                      return Center(
                        child: CategoryCards(
                          iconImage: faIcons[index],
                          avatarColor: colorCodes[index],
                          category: menuText[index],
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                    top: _height * 0.18,
                    left: _width * 0.02,
                    child: SectionRows(
                      sectionName: 'Top Coins',
                      width: _width * 0.58,
                      route: PortfolioScreen.id,
                    )
                ),
                Positioned(
                  top: _height * 0.23,
                  left: _width * 0.01,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.225,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: <Widget>[
                            CoinCards(),
                            CoinCards(),
                            CoinCards(),
                            CoinCards(),
                            CoinCards(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: _height * 0.48,
                  left: _width * 0.02,
                  child: SectionRows(
                    sectionName: 'Gainers and Losers',
                    width: _width * 0.3,
                    route: PortfolioScreen.id,
                  ),
                ),
                Positioned(
                  top: _height * 0.53,
                  left: _width * 0.01,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.225,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: <Widget>[
                            CoinCards(),
                            CoinCards(),
                            CoinCards(),
                            CoinCards(),
                            CoinCards(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: _height * 0.77,
                  left: _width * 0.02,
                  child: SectionRows(
                    sectionName: 'News',
                    width: _width * 0.68,
                    route: PortfolioScreen.id,
                  )
                  ,
                ),
                Positioned(
                  top: _height * 0.81,
                  left: _width * 0.02,
                  child: Container(
                    height: _height * 0.57,
                    width: _width,
                    child: (_loading == true ) ?
                    Center(child: CircularProgressIndicator()):
                    RefreshIndicator(
                      child: ListView.builder(
                        itemCount: (_news.length > 0 && _news.length <=10 ? 10 : _news.length),
                        itemBuilder: (BuildContext context, index){
                          if( _news[index]['kind'] == 'news'){

                            return Center(
                              child:  NewsCard(
                                title: _news[index]['title'],
                                author: _news[index]['source']['title'],
                                source: _news[index]['domain'],
                                url: _news[index]['url'],
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      onRefresh: _getNewsFeedData,
                    ),
                  ),
                ),
                Positioned(
                  top: _height * 1.4,
                  left: _width * 0.05,
                  child: Container(
                    width: _width * 0.9,
                    height: _height * 0.05,
                    child: FlatButton(

                      color: Colors.lightBlueAccent,
                      onPressed: (){},
                      child:
                      Text('See All News',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,

                          )),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// class CategoriesScroller extends StatelessWidget {
//   const CategoriesScroller();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SingleChildScrollView(
//       physics: ScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[
//               CoinCards(),
//               CoinCards(),
//               CoinCards(),
//               CoinCards(),
//               CoinCards(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }