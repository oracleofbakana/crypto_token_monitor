import 'package:crypto_monitor/screens/discover.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crypto_monitor/screens/watchlist.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 0;


  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      onTap: _onItemTap,
      backgroundColor: Colors.transparent,
      //backgroundColor: Colors.white,
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff12326b),
      unselectedItemColor: Color(0xff94a3c1),

      unselectedLabelStyle: TextStyle(
        color: Color(0xff12326b),
      ),
      selectedFontSize: 14.0,
      unselectedFontSize: 14.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      //type: BottomNavigationBarType.fixed,
      iconSize: 22.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(FontAwesomeIcons.home),
            onPressed: () {},
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(FontAwesomeIcons.chartBar),
            onPressed: () {},
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(FontAwesomeIcons.chartPie),
            onPressed: () {
              Navigator.pushNamed(context, WatchlistScreen.id);
            },
          ),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(FontAwesomeIcons.compass),
            onPressed: () {
              Navigator.pushNamed(context, DiscoverNewsPage.id);
            },
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(FontAwesomeIcons.ellipsisH),
            onPressed: () {},
          ),
          label: 'Profile',
        ),
      ],
    );

  }
}