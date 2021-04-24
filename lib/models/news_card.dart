import 'package:flutter/material.dart';
// import 'package:crypto_monitor/services/feed_reader.dart';

class NewsCard extends StatefulWidget {
  final String title;
  final String author;
  final String source;
  //final String description;
  final String url;
  final String publishedDate;

  NewsCard({this.title, this.source, this.author, this.url, this.publishedDate});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {


  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height * 0.12,
      width: _width * 0.95,
      //margin: EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      margin: EdgeInsets.only(left: 3.0, top: 10.0, right: 5.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text('BTC'),
              height: _height * 0.1,
              width:  _width * 0.18,
              padding: EdgeInsets.only(left: 10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0),
                ),
                color: Colors.blue.shade700,

              )
          ),
          Column(
            children: [
              Container(
                height: _height * 0.07,
                width:  _width * 0.70,
                margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(widget.title,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _height * 0.005),
              Container(
                child: Text(widget.source),
                height: _height * 0.015,
                width:  _width * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0),
                  ),
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }
}
