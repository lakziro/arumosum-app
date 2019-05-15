import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:arumosum/components/colors.dart';
import 'package:arumosum/pages/homepage.dart';
import 'package:arumosum/pages/shoppage.dart';
import 'package:arumosum/pages/offers.dart';
import 'package:arumosum/pages/profile.dart';
import 'package:arumosum/pages/settings.dart';
import 'package:arumosum/pages/shoppingcart.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  var _pageOption = [HomePage(), ShopPage(), Offers(), Profile(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orrangeColor,
        centerTitle: true,
        leading: IconButton(
          tooltip: 'Menu',
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Container(
              child: Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
          )),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Shopping cart',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: iconColor,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: iconColor,
          ),
          Icon(
            Icons.compare_arrows,
            size: 30,
            color: iconColor,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: iconColor,
          ),
          Icon(
            Icons.more_horiz,
            size: 30,
            color: iconColor,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: gray,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOption[_page],
    );
  }
}
