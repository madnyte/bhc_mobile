import 'package:bhc_mobile/ui/home/home_page.dart';
import 'package:bhc_mobile/ui/house/house_details.dart';
import 'package:bhc_mobile/ui/search/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List pages = [
    const HomePage(),
    const HouseDetails(),
    const SearchPage(),
    const HomePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          items: <Widget>[
            FaIcon(
              FontAwesomeIcons.house,
              size: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            FaIcon(
              FontAwesomeIcons.heart,
              size: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            FaIcon(
              FontAwesomeIcons.user,
              size: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            FaIcon(
              FontAwesomeIcons.gear,
              size: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
        ),
      ),
    );
  }
}
