import "package:flutter/material.dart";
import 'package:slow_down_app/ui/dashboard_screen.dart';
import 'package:slow_down_app/ui/geo_screen.dart';
import 'package:slow_down_app/ui/placeholder_widget.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashboardScreen(),
    GeoScreen(),
    PlaceholderWidget(Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.red[600],
        selectedLabelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 14.0,
          fontWeight: FontWeight.w700
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 14.0,
          color: Colors.grey
        ),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        iconSize: 22.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: Colors.grey,
            ),
            label: "Geofence",

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics_outlined,
              color: Colors.grey,
            ),
            label: "Stats"
          )
        ]
      )
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

