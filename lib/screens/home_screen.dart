import 'package:crypto_monitor/models/news_card.dart';
import 'package:crypto_monitor/models/sections.dart';
import 'package:crypto_monitor/screens/portfolio.dart';
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
            height: _height * 1.4,
          child: Stack(
            children: <Widget>[
              Positioned(
                //left: _width * 0.05,
                child: GridView.count(
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
                )
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
                child: Column(
                  children: List.generate(5, (index) {
                  return Center(
                    child: NewsCard(),
                  );
                }),

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
