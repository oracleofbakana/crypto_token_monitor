import 'package:flutter/material.dart';

class SectionRows extends StatelessWidget {
  final String sectionName;
  final double width;
  final String route;

  SectionRows({this.sectionName, this.width, this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Text(
        sectionName,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(width: width),
      //_width * 0.68
      InkWell(
        child: Text('See All'),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    ],
    );
  }
}
