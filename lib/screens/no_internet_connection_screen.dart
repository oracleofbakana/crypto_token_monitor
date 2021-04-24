import 'package:flutter/material.dart';

class NoInternetConnectionWidget extends StatelessWidget {

  NoInternetConnectionWidget({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height,
      width: _width,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          Positioned(
              top: _height * 0.2,
              left: _width * 0.2,
              child: Text(
            "An error has occurred. Please try again.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          ),
          SizedBox(
            width: _width * 0,
            height: _height * 0.1,),
          Positioned(
            top: _height * 0.5,
            left: _width * 0.08,
            child: FlatButton(padding: EdgeInsets.all(15.0),
              onPressed: onPressed,
              minWidth: _width * 0.82,
              height: _height * 0.04,
              color: Color(0xff0195fa),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                'Retry',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffa6aab5),
                ),
              ),
            )

          ),
        ],
      ),
    );
  }
}
