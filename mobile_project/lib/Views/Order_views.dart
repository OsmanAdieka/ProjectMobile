// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'FavScreen_views.dart';
import 'HomeScreen_views.dart';
import 'ShoppingScreen_views.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Flutter Class'),
      ),
      body: Center(
        child: Text(
          'Stay Tuned!',
          style: TextStyle(fontSize: 24),
        ), 
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}



class BottomNavBar extends StatelessWidget {
  var menus = [
     FeatherIcons.heart,
    FeatherIcons.book,
    FeatherIcons.home,
    FeatherIcons.shoppingBag,
    Icons.person,
  ];
  var selectedMenu = FeatherIcons.book;

  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFF372E1D),
      type: BottomNavigationBarType.fixed,
      items: menus
          .map((e) =>
              BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
          .toList(),
      currentIndex: menus.indexOf(selectedMenu),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: const Color(0xFFBFBFBF),
      onTap: (index) {
        if (menus[index] == FeatherIcons.heart) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => CoffeeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        } else if (menus[index] == FeatherIcons.home) {
          // Tidak perlu menambahkan BottomNavBar di sini
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
        else if (menus[index] == FeatherIcons.shoppingBag) {
          // Tidak perlu menambahkan BottomNavBar di sini
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ShoppingPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
        else if (menus[index] == Icons.person) {
          // Tidak perlu menambahkan BottomNavBar di sini
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
      },
    );
  }
}
