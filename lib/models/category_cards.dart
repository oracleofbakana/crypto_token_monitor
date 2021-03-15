import 'package:flutter/material.dart';

class CategoryCards extends StatelessWidget {
  final String category;
  final Widget iconImage;
  final Color avatarColor;

  CategoryCards(
      {@required this.category, @required this.iconImage, this.avatarColor});

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width * 0.45,
      height: _height * 0.065,
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xffffffff),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: avatarColor,
              child: iconImage,
            ),
          ),
          SizedBox(
            width: _width * 0.03,
          ),
          Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: Color(0xff5a5a5a),
            ),
          )
        ],
      ),
    );
  }
}
