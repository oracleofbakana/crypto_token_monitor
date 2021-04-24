import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class CoinRow extends StatefulWidget {

  final int id;
  final String coinName;
  final String coinSymbol;
  final String slug;
  final int cmcRank;
  //final String logo;
  final String maxSupply;
  final double circulatingSupply;
  final double marketCap;
  final double price;
  //final double volume_24h;
  final double percentChange_24h;



  CoinRow({
    @required this.id,
    @required this.coinName,
    @required this.coinSymbol,
    this.slug,
    @required this.cmcRank,
    this.maxSupply,
    this.circulatingSupply,
    this.marketCap,
    this.price,
    //@required this.logo,
    //this.volume_24h,
    @required this.percentChange_24h,
  });


  @override
  _CoinRowState createState() => _CoinRowState();
}

class _CoinRowState extends State<CoinRow> {



  String marketCapFormat(double marketCap){
    var currencySymbol = NumberFormat.simpleCurrency(locale: "en_US").currencySymbol;
     return NumberFormat.compactCurrency(locale: "en_US", name: "USD", symbol: currencySymbol, decimalDigits: 2).format(marketCap);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 1,
      color: Colors.white,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.start, //change here don't //worked
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 25,
            width: 25,
            margin: EdgeInsets.only(
                left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                widget.coinName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    width: 25.0,
                    height: 15.0,
                    padding: EdgeInsets.only(left: 7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xffb6b7b8),
                    ),
                    child: Text(
                      widget.cmcRank.toString(),
                      style: TextStyle(
                        color: Color(0xff0f0f0f),
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    widget.coinSymbol,
                    style: TextStyle(
                        color: Color(0xff7b838c),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    ('${widget.percentChange_24h.toStringAsFixed(2)}%'),
                    style: TextStyle(color: Color(0xff7b838c),
                        fontSize: 12.0),
                  ),
                ],
              )
            ],
          ),
          new Spacer(), //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                widget.price >= 0.01 ?
                ('\$${widget.price.toStringAsFixed(2)}') : ('\$${widget.price.toStringAsFixed(4)}'),
                style: TextStyle(
                    color: Color(0xff050505),
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal),
              ),
              Row(
                children: [
                  Text(
                    'MktCap: ',
                    style: TextStyle(
                      color: Color(0xff7b838c),
                      fontSize: 11.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    marketCapFormat(widget.marketCap),
                    style: TextStyle(
                      color: Color(0xff7b838c),
                      fontSize: 11.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),

            ],
          ), // I just added one line
          Container(
            margin: EdgeInsets.all(10.0),
            child: Icon(Icons.star, color: Colors.yellow),
          )
        ],
      ),
    );
  }
}
