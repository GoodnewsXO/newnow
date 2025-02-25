import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newnow/utils/constants.dart';
import 'package:newnow/views/main_screens/bookmark_page.dart';
import 'package:newnow/views/main_screens/explore_page.dart';
import 'package:newnow/views/main_screens/home_page.dart';
import 'package:newnow/views/main_screens/profile.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;

  final List<Widget> _Screens = [
    HomePage(),
    ExplorePage(),
    BookmarkPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: Color(0xffe6e6e6)))),
        child: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Home_active.svg',
                    color: kPrimaryColor),
                activeIcon: SvgPicture.asset('assets/icons/Home_inactive.svg'),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Explore_active.svg',
                    color: kPrimaryColor),
                activeIcon:
                    SvgPicture.asset('assets/icons/Explore_inactive.svg'),
                label: 'Discover'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Bookmark_active.svg',
                    color: kPrimaryColor),
                activeIcon:
                    SvgPicture.asset('assets/icons/Bookmark_inactive.svg'),
                label: 'Bookmarks'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Profile - inactive.svg',
                    color: kPrimaryColor),
                activeIcon: SvgPicture.asset('assets/icons/Profile.svg'),
                label: 'Profile'),
          ],
          selectedLabelStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: -0.3),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ),
      body: _Screens[_pageIndex],
    );
  }
}
