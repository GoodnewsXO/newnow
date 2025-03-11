import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newnow/controllers/news_controller.dart';
import 'package:newnow/models/news.dart';
import 'package:newnow/utils/constants.dart';

class RecommendedNews extends StatelessWidget {
  final NewsController _newsController = NewsController();
  RecommendedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
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
                      ? DateFormat('MMMM dd, yyyy').format(article.createdAt!)
                      : 'Date Unavailable';
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color(0xffF9FCFE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                      borderRadius: BorderRadius.circular(5),
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
                                          color: kHeadingColor.withOpacity(0.5),
                                          fontFamily: 'SourceSansPro',
                                        ),
                                      ),
                                      Text(
                                        dateToDisplay,
                                        style: TextStyle(
                                          letterSpacing: -0.25,
                                          fontSize: 14,
                                          color: kHeadingColor.withOpacity(0.5),
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
                                      color: kHeadingColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22.0, vertical: 9),
                                      child: Text('Follow',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: kHeadingColor,
                                            fontFamily: 'SourceSansPro',
                                          )),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.more_vert_outlined),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            article.title ?? 'no title found',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: kPrimaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8),
                              child: Text(
                                article.categoryName ?? 'No category',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.3),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(article.bannerImageUrl ??
                                    'https://via.placeholder.com/300'), // Handle null bannerImageUrl
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
