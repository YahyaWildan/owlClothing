import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/home/home_page.dart';
import 'package:ocp/ui/pages/product/point%20store/page/point_store_page.dart';
import 'package:ocp/ui/pages/profile/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    HomePage(),
    PointStorePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.card_giftcard,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
    ];
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            body: screens[index],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                items: items,
                height: 60,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 300),
                color: kPrimaryColor,
                index: index,
                onTap: (index) => setState(
                  () => this.index = index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
