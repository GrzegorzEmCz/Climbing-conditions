import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:login/screens/home/home.dart';
import 'package:login/services/auth.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State < Nav > {

  final AuthService _auth = AuthService();
//definicja zmiennych
  int _selectedIndex = 0;

//definicja listy widget o nazwie _widgetOptions 
  List < Widget > _widgetOptions = < Widget > [
                                                Home(),
                                                Text('Search Screen'),
                                                Text('Add Screen'),
                                                Text('Favorite Screen'),
                                                Text('Person Screen'),
                                              ];

// Definicja funkcji _onItemTab
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//START AppBar ---------------------------------------------------------
          appBar: AppBar(
            title: Text('Climbing Conditions'),
            backgroundColor: Color(0xff2c3d63),
            elevation: 0.0,
            actions: < Widget > [
              FlatButton.icon(
                icon: Icon(Icons.exit_to_app, color: Colors.white,),
                textColor: Colors.white,
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
//START Wypełnienie pola - odwołanie do elementu w liście _widgetOptions
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
//KONIEC Wypełnienie pola ----------------------------------------------
//START NavigationBar --------------------------------------------------
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff2c3d63),
        backgroundColor: Colors.white10,
        buttonBackgroundColor: Color(0xffff6f5e),
        height: 60,
        items: < Widget > [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.add_circle, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: _onItemTap,
      ),
//KONIEC NavigationBar -------------------------------------------------
    );
  }
}