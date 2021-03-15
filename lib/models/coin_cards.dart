import 'package:flutter/material.dart';

class CoinCards extends StatelessWidget {
  final Widget iconImage;
  final String price = "59,622.56";

  CoinCards({this.iconImage});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.35 - 70;
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width * 0.5,
      margin: EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: CircleAvatar(

                //backgroundColor: avatarColor,
                child: iconImage,
              ),
            ),
            SizedBox(height: 2),
            Container(
              height: 25.0,
              width: _width * 0.25,
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0),
                ),
              ),
              child: Text(
                'Bitcoin',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff060606),
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              height: 25.0,
              width: _width * 0.4,
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0),
                ),
              ),
              child: Text(
                r"$59,622.10",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff838896),
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              height: 25.0,
              width: _width * 0.15,
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0),
                ),
              ),
              child: Text(
                '5%',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff1d1d1d),
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
