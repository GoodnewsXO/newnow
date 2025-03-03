import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newnow/controllers/news_controller.dart';
import 'package:newnow/models/news.dart';
import 'package:newnow/utils/constants.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final NewsController _newsController = NewsController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: kHeadingColor.withOpacity(0.13)),
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
                      border:
                          Border.all(color: kHeadingColor.withOpacity(0.13)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/notification.svg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Welcome back, Tyler!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.9,
                  color: kHeadingColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Discover a world of news that matters to you',
                style: TextStyle(
                  fontSize: 16,
                  color: kHeadingColor.withOpacity(0.5),
                  fontFamily: 'SourceSansPro',
                ),
              ),
              SizedBox(height: 30),
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
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              FutureBuilder<List<News>>(
                future: _newsController.fetchTrendingNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  final List<News> news = snapshot.data!;

                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        final article = news[index];
                        // DateTime formatting logic MOVED HERE
                        String dateToDisplay = article.createdAt != null
                            ? DateFormat('MMMM dd, yyyy')
                                .format(article.createdAt!)
                            : 'Date Unavailable';

                        return Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color(0xffF9FCFE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(article
                                                  .bannerImageUrl ??
                                              'https://via.placeholder.com/300'), // Handle null bannerImageUrl
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          article.categoryName ??
                                              'no category', // Replace with actual category
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Text(
                                  article.title ??
                                      'No Title', // Handle null title
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: kHeadingColor,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/BBC news.png'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'BBC News', // Replace with actual author
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                kHeadingColor.withOpacity(0.5),
                                            fontFamily: 'SourceSansPro',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      dateToDisplay, // Use dateToDisplay here
                                      style: TextStyle(
                                        letterSpacing: -0.25,
                                        fontSize: 14,
                                        color: kHeadingColor.withOpacity(0.5),
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              Text('Recommendations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                    color: kHeadingColor,
                  )),
              SizedBox(height: 30),
              FutureBuilder<List<News>>(
                  future: _newsController.fetchRecommendedNews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    final List<News> news = snapshot.data!;
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            final article = news[index];
                            String dateToDisplay = article.createdAt != null
                                ? DateFormat('MMMM dd, yyyy')
                                    .format(article.createdAt!)
                                : 'Date Unavailable';
                            return Container(
                              margin: EdgeInsets.only(right: 20),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(0xffF9FCFE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    //Top Row Section
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 36,
                                              width: 36,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/BBC news.png'),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'BBC News', // Replace with actual author
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: kHeadingColor
                                                        .withOpacity(0.5),
                                                    fontFamily: 'SourceSansPro',
                                                  ),
                                                ),
                                                Text(
                                                  dateToDisplay, // Use dateToDisplay here
                                                  style: TextStyle(
                                                    letterSpacing: -0.25,
                                                    fontSize: 14,
                                                    color: kHeadingColor
                                                        .withOpacity(0.5),
                                                    fontFamily: 'SourceSansPro',
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        // Follow button and More Icon
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: kHeadingColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 22.0,
                                                        vertical: 9),
                                                child: Text('Follow',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: kHeadingColor,
                                                      fontFamily:
                                                          'SourceSansPro',
                                                    )),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Icon(Icons.more_vert_outlined),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
