import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:unicons/unicons.dart';

import 'News/news_page.dart';
import 'Skripsi/skripsi_page.dart';
import 'Index/index_page.dart';
import 'KerjaPraktek/kerja_praktek_page.dart';
import 'Settings/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 2;

  final screens = [
    const NewsPage(),
    const SkripsiPage(),
    const IndexPage(),
    const KerjaPraktekPage(),
    const SettingPage(),
  ];

  final icons = const [
    Icon(UniconsLine.newspaper, color: Colors.white, size: 25),
    Icon(UniconsLine.book, color: Colors.white, size: 25),
    Icon(UniconsLine.home_alt, color: Colors.white, size: 25),
    Icon(UniconsLine.folder_open, color: Colors.white, size: 25),
    Icon(UniconsLine.setting, color: Colors.white, size: 25)
  ];

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: icons,
        index: _index,
        height: 50,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color(0xff4EA8DE),
        color: const Color(0xff4EA8DE),
        animationDuration: const Duration(milliseconds: 200),
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
      body: screens[_index],
    );
  }
}
