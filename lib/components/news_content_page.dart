import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newnow/models/news.dart';
import 'package:newnow/utils/constants.dart';

class NewsContentPage extends StatelessWidget {
  final News news;

  const NewsContentPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kHeadingColor.withOpacity(0.13)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/left-menu.svg'),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kHeadingColor.withOpacity(0.13)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/share.svg'),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              news.title ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(news.bannerImageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
                Container(),
                Text('follow')
              ],
            )
          ],
        ),
      ),
    );
  }
}
