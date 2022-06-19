// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_takeaseat/pages/booking_page.dart';
import 'package:flutter_takeaseat/pages/favorites_page.dart';
import 'package:flutter_takeaseat/pages/home_page.dart';
import 'package:flutter_takeaseat/pages/profile_page.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = <Widget>[
    HomePage(),
    ProfilePage(),
    FavoritesPage(),
    BookingPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          iconSize: 35,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 165, 208, 246),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 165, 208, 246),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_rounded),
              label: 'Favorites',
              backgroundColor: Color.fromARGB(255, 225, 170, 233),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Booking',
              backgroundColor: Color.fromARGB(255, 145, 192, 183),
            ),
          ],
        ),
      );
}
