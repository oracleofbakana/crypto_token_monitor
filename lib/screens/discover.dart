import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_monitor/models/bottom_navbar.dart';
import 'package:crypto_monitor/models/sections.dart';
import 'package:crypto_monitor/screens/portfolio.dart';
import 'package:crypto_monitor/models/news_card.dart';
import 'package:crypto_monitor/services/feed_reader.dart';

class DiscoverNewsPage extends StatefulWidget {
  static const String id = 'DiscoverScreen';

  @override
  _DiscoverNewsPageState createState() => _DiscoverNewsPageState();
}

class _DiscoverNewsPageState extends State<DiscoverNewsPage> {
  List<Widget> itemsData = [];

  List _news = [];

  @override
  void initState(){
        () async {
      FeedReader feed = new FeedReader();
      var feedData = await feed.getData();
      print('http request');
      print(feedData);

      setState(() {
        _news = feedData['results'];
      });
    } ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text('Discover'),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
              child: SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                 physics: ScrollPhysics(),
                 child: Container(
                   height: _height * 3.0,
                   child: Stack(
                     children: <Widget>[
                       Positioned(
                         top: _height * 0.01,
                         left: _width * 0.02,
                         child: SectionRows(
                           sectionName: 'Trending',
                           width: _width * 0.6,
                           route: PortfolioScreen.id,
                         ),
                       ),
                       Positioned(
                         top: _height * 0.05,
                         left: _width * 0.02,
                         child: Container(
                           height: _height * 0.35,
                           width: _width * 0.95,
                           decoration: BoxDecoration(
                             //color: Colors.red,
                               borderRadius: BorderRadius.circular(15.0)),
                           child: CarouselSlider(
                             options: CarouselOptions(
                               height: MediaQuery
                                   .of(context)
                                   .size
                                   .height * 0.34,
                               aspectRatio: 12 / 9,
                               viewportFraction: 145,
                               initialPage: 0,
                               enableInfiniteScroll: true,
                               reverse: false,
                               autoPlay: true,
                               autoPlayInterval: Duration(seconds: 5),
                               autoPlayAnimationDuration: Duration(
                                   milliseconds: 1000),
                               autoPlayCurve: Curves.easeIn,
                               enlargeCenterPage: true,
                               //onPageChanged: callbackFunction,
                               scrollDirection: Axis.horizontal,
                             ),
                             items: list
                                 .map((item) =>
                                 Column(
                                   children: [
                                     Container(
                                       height: _height * 0.23,
                                       width: _width * 0.86,
                                       decoration: BoxDecoration(
                                           color: Colors.green,
                                           borderRadius: BorderRadius.circular(
                                               15.0)),
                                       child: Image.asset(
                                         'assets/images/coindesk.jpg',
                                         fit: BoxFit.fill,
                                         width: double.infinity,
                                         height: double.infinity,
                                       ),
                                     ),
                                     Column(
                                       children: [
                                         Container(
                                           height: _height * 0.07,
                                           width: _width * 0.85,
                                           margin: EdgeInsets.only(top: 4.0),
                                           color: Colors.white,
                                           child: Text(
                                             'Bitcoin about to go parabolic. Top Analysts predict an incoming 300% move before September 21',
                                             overflow: TextOverflow.ellipsis,
                                             maxLines: 3,
                                             softWrap: true,
                                             style: TextStyle(
                                               fontWeight: FontWeight.w500,
                                               fontSize: 16.0,
                                             ),
                                           ),
                                         ),

                                         Container(
                                           height: _height * 0.02,
                                           width: _width * 0.85,
                                           margin: EdgeInsets.only(top: 2),
                                           color: Colors.white,
                                           child: Text(
                                             'Coindesk  * 15h ago ',
                                             overflow: TextOverflow.clip,
                                             softWrap: true,
                                             style: TextStyle(
                                               fontWeight: FontWeight.w500,
                                               fontSize: 16.0,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                             )
                                 .toList(),
                           ),
                         ),
                       ),

                       Positioned(
                         top: _height * 0.42,
                         left: _width * 0.02,
                         child: SectionRows(
                           sectionName: 'News',
                           width: _width * 0.68,
                           route: PortfolioScreen.id,
                         ),
                       ),

                       Positioned(
                         top: _height * 0.45,
                         left: _width * 0.02,
                         child: Container(
                           height: _height * 0.57,
                           width: _width,
                           child: ListView.builder(
                             itemCount: (_news.length > 0 && _news.length <=15 ? 15 : _news.length),
                             itemBuilder: (BuildContext context, index){
                               if( _news[index]['kind'] == 'news'){
                                 return Center(
                                   child: NewsCard(
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
                         ),
                         // child: Column(
                         //   children: List.generate(15, (index) {
                         //     return Center(
                         //       child: NewsCard(),
                         //     );
                         //   }),
                         //
                         // ),
                       ),
                     ],
                   ),
                 ),
               ),
            ),
        );
  }
}
