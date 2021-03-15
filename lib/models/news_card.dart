import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;


    return Container(
      height: _height * 0.12,
      width: _width * 0.95,
      color: Colors.white,
      margin: EdgeInsets.only(left: 3.0, top: 10.0, right: 5.0, bottom: 3.0),
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
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Flexible(

                      child: Text('Bitcoin Price Just Broke through \$60\,500 Setting All\-Time High Setting All\-Time High Setting All\-Time High',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                child: Text('Coin Desk'),
                height: 20.0,
                width:  300.0,
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
