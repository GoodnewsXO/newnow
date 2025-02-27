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
        child: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _buildNavItem('assets/icons/Home_inactive.svg',
                'assets/icons/Home_active.svg', 'Home', 0, _pageIndex),
            _buildNavItem('assets/icons/Explore_inactive.svg',
                'assets/icons/Explore_active.svg', 'Discover', 1, _pageIndex),
            _buildNavItem('assets/icons/Bookmark_inactive.svg',
                'assets/icons/Bookmark_active.svg', 'Bookmarks', 2, _pageIndex),
            _buildNavItem('assets/icons/Profile_inactive.svg',
                'assets/icons/Profile_active.svg', 'Profile', 3, _pageIndex),
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

  BottomNavigationBarItem _buildNavItem(String inactiveIcon, String activeIcon,
      String label, int index, int currentPageIndex) {
    return BottomNavigationBarItem(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            index == currentPageIndex ? activeIcon : inactiveIcon,
            color: index == currentPageIndex
                ? null
                : const Color.fromARGB(255, 175, 175, 175),
          ),
          if (index == currentPageIndex) ...[
            SizedBox(width: 3),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: kHeadingColor,
              ),
            ),
          ],
        ],
      ),
      label: '',
    );
  }
}
