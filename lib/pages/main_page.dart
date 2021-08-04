import 'package:flutter/material.dart';
import 'package:food/pages/favorite_page.dart';
import 'package:food/pages/home_page.dart';
import 'package:food/pages/notifications_page.dart';
import 'package:food/pages/profile_page.dart';
import 'package:food/theme.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomNavbar() {
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        decoration: BoxDecoration(
          color: bg1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.house_outlined),
                title: Text('Home'),
                selectedColor: primaryColor,
                unselectedColor: unSelect,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.notifications_outlined),
                title: Text(
                  'Notifications',
                ),
                selectedColor: primaryColor,
                unselectedColor: unSelect,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_outline),
                title: Text('Favorite'),
                selectedColor: primaryColor,
                unselectedColor: unSelect,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.person_outline),
                title: Text('Profile'),
                selectedColor: primaryColor,
                unselectedColor: unSelect,
              ),
            ],
          ),
        ),
      );
    }

    Widget? body() {
      switch (_currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return NotificationsPage();
        case 2:
          return FavoritePage();
        case 3:
          return ProfilePage();
        default:
          HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: bottomNavbar(),
      body: body(),
    );
  }
}
