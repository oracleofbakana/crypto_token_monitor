import 'package:flutter/material.dart';


class CryptoMonitorAppBar extends StatelessWidget
    with PreferredSizeWidget {

  @override
  final Size preferredSize = Size.fromHeight(65.0);



  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(20,30, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Icon(Icons.navigate_before,size: 40,color: Colors.white,),
                Text(
                  "Home",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                Icon(Icons.search,size: 34,color: Colors.white,),
                CircleAvatar(
                  backgroundColor: Colors.red,
                 child: Text('64'),

                 //icon: Icon(Icons.notifications, size: 34, color: Colors.red,
                 ),
                 // onPressed: () {},
                //),

            ],
            ),
          ),
        ),
      ),
    );
  }
}
