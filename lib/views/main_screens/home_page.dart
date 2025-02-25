import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newnow/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kHeadingColor.withOpacity(0.13)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset('assets/icons/left-menu.svg'),
          ),
        ),
        actions: [SvgPicture.asset('assets/icons/notification.svg')],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Welcome back, Tyler!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.9,
                color: kHeadingColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Discover a world of news that matters to you',
              style: TextStyle(
                  fontSize: 16,
                  color: kHeadingColor.withOpacity(0.5),
                  fontFamily: 'SourceSansPro'),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Trending news',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                    color: kHeadingColor,
                  ),
                ),
                Spacer(),
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 14,
                      color: kHeadingColor.withOpacity(0.5),
                      fontFamily: 'SourceSansPro'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
