import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newnow/controllers/news_controller.dart';
import 'package:newnow/models/news.dart';
import 'package:newnow/utils/constants.dart';

class TrendingNews extends StatelessWidget {
  final NewsController _newsController = NewsController();
  TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
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
              String dateToDisplay = article.createdAt != null
                  ? DateFormat('MMMM dd, yyyy').format(article.createdAt!)
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
                                image: NetworkImage(article.bannerImageUrl ??
                                    'https://via.placeholder.com/300'),
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
                                borderRadius: BorderRadius.circular(6),
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
                        article.title ?? 'No Title', // Handle null title
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
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'BBC News', // Replace with actual author
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kHeadingColor.withOpacity(0.5),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
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
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
