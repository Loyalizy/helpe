import 'package:AnimeTare/ui/favorite_page.dart';
import 'package:AnimeTare/ui/history_page.dart';
import 'package:AnimeTare/ui/home_page.dart';
import 'package:AnimeTare/ui/info_page.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class BaseNavigationBar extends StatefulWidget {
  const BaseNavigationBar({Key? key}) : super(key: key);

  @override
  State<BaseNavigationBar> createState() => _BaseNavigationBarState();
}

class _BaseNavigationBarState extends State<BaseNavigationBar> {
  int _currentIndex = 0;
  List<Widget> _widgetOption = [
    HomePage(),
    FavoritePage(),
    HistoryPage(),
    InfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_currentIndex),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Colors.red,
        unSelectedColor: Colors.white,
        backgroundColor: Colors.black87,
        // borderRadius: Radius.circular(20.0),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          CustomNavigationBarItem(icon: Icon(Icons.home)),
          CustomNavigationBarItem(icon: Icon(Icons.favorite)),
          CustomNavigationBarItem(icon: Icon(Icons.history)),
          CustomNavigationBarItem(icon: Icon(Icons.info)),
        ],
      ),
    );
  }
}
