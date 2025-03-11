import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newnow/components/All_News.dart';
import 'package:newnow/components/recommended_news.dart';
import 'package:newnow/components/trending_news.dart';
import 'package:newnow/controllers/channel_controller.dart';
import 'package:newnow/models/user.dart';
import 'package:newnow/utils/constants.dart';

class ExplorePage extends StatelessWidget {
  final ChannelController _channelController = ChannelController();
  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: TextStyle(
                      fontSize: 26, fontFamily: 'Roboto', color: Colors.black),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Uncover a world of captivating stories and \nstay informed',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SourceSansPro',
                      color: kTextColor),
                )
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search “News”',
                        hintStyle: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontFamily: 'SourceSansPro',
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset(
                            'assets/icons/search-normal.svg',
                            height: 7,
                          ),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Publishers',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              FutureBuilder<List<Users>>(
                future: _channelController.fetchChannel(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Failed to load users. Please try again.',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }

                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'No users found.',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  final List<Users> channel = snapshot.data!;

                  return Container(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: channel.length,
                      itemBuilder: (context, index) {
                        final account = channel[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(account.profile_image ??
                                        'https://via.placeholder.com/300'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                account.username,
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 238, 238, 238),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 39.0, vertical: 9),
                                  child: Text('Follow'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'News',
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: 25,
              ),
              DefaultTabController(
                  length: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: TabBar(
                            labelColor: Colors.blue,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.blue,
                            tabs: [
                              Tab(
                                text: 'All',
                              ),
                              Tab(
                                text: 'Recommended',
                              ),
                              Tab(
                                text: 'Popular',
                              ),
                              Tab(
                                text: 'Most visited',
                              ),
                              Tab(
                                text: 'Trending',
                              )
                            ]),
                      ),
                      SizedBox(
                          height: 300,
                          child: TabBarView(children: [
                            AllNews(),
                            RecommendedNews(),
                            Center(child: Text('For You News Content')),
                            Center(child: Text('For You hhh Content')),
                            TrendingNews(
                              scrollDirection: Axis.vertical,
                            )
                          ]))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
