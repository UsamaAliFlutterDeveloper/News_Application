import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../firebase/news/get_news_view.dart';
import '../../model/news_model.dart';
import '../../res/assets/images.dart';
import '../../res/colors/colors.dart';
import '../../res/components/widgets/appbar/custom_app_bar.dart';
import '../../res/components/widgets/button/news button/news_button_widget.dart';
import '../../res/components/widgets/navigationbar/bottom_nav_bar.dart';
import '../../res/components/widgets/news/icon/icon_container_widget.dart';
import '../../res/components/widgets/news/news_container_widget.dart';
import '../../res/customview/news_description_view.dart';
import '../../res/routes/routes_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<NewsModel> news0 = [];

    Future<List<NewsModel>?> getNews() async {
      List<NewsModel> news = [];
      try {
        DatabaseEvent newsSnapShot = await FirebaseDatabase.instance
            // ignore: deprecated_member_use
            .reference()
            .child("News")
            .child("All News")
            .orderByChild('time')
            .once();

        if (newsSnapShot.snapshot.value != null) {
          Map<dynamic, dynamic> values =
              newsSnapShot.snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, value) {
            NewsModel newsModel = NewsModel.fromJson(value);
            news.add(newsModel);
          });
          news.sort((a, b) => b.time!.compareTo(a.time!));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return null;
      }
      return news;
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Voice News',
          icon: true,
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(DateFormat("EEEEE, dd, yyyy").format(DateTime.now()),
                          style: const TextStyle(
                              color: AppColor.redColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.italic)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(DateFormat("hh:mm:ss a").format(DateTime.now()),
                          style: const TextStyle(
                              color: AppColor.drakerColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
                ///////////////////////// Horizontal list  View /////////////////////////
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: Get.height * 0.20,
                    child: FutureBuilder<List<NewsModel>?>(
                      future: getNews(),
                      builder:
                          (context, AsyncSnapshot<List<NewsModel>?> snapshot) {
                        try {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            news0 = snapshot.data!;
                            return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 10);
                                },
                                itemCount: news0.length,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  NewsModel news = news0[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        NewsDescriptionView(
                                          category: news.category.toString(),
                                          time: news.time.toString(),
                                          name: news.name.toString(),
                                          image: Image.network(
                                            news.image1.toString(),
                                            fit: BoxFit.cover,
                                          ),
                                          des: news.des.toString(),
                                        ),
                                      );
                                    },
                                    child: CustomContainer(
                                      name: news.name.toString(),
                                      image1: Image.network(
                                        news.image1.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                      height: Get.height * 0.20,
                                      width: Get.width * 0.7,
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                              child: Text('No news found.'),
                            );
                          }
                        } catch (e) {
                          return const Center(
                            child: Text('Error fetching news data.'),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ///////////////////////// Center Container View /////////////////////////
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: Get.height * 0.27,
                    width: Get.width * 0.15,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2.0, color: AppColor.redColor),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/headlines.png",
                                  scale: 6,
                                ),
                                text: 'Headlines',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Headlines",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/currentaffairs.png",
                                  scale: 6,
                                ),
                                text: 'Current Affairs',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Current Affairs",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/sports.png",
                                  scale: 6,
                                ),
                                text: 'Sports',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Sports",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/international.png",
                                  scale: 6,
                                ),
                                text: 'International',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "International",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/entertiament.png",
                                  scale: 6,
                                ),
                                text: 'Entertainment',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Entertainment",
                                  ));
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/business.png",
                                  scale: 6,
                                ),
                                text: 'Business',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Business",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/politics.png",
                                  scale: 30,
                                ),
                                text: 'Politics',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Politics",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/health.png",
                                  scale: 30,
                                ),
                                text: 'Health',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Health",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/technology.png",
                                  scale: 40,
                                ),
                                text: 'Technology',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Technology",
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/crime.png",
                                  scale: 30,
                                ),
                                text: 'Crime',
                                onTap: () {
                                  Get.to(const GetNewsView(
                                    text: "Crime",
                                  ));
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 68),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/education.png",
                                    scale: 30,
                                  ),
                                  text: 'Education',
                                  onTap: () {
                                    Get.to(const GetNewsView(
                                      text: "Education",
                                    ));
                                  },
                                ),
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/religion.png",
                                    scale: 30,
                                  ),
                                  text: 'Religion',
                                  onTap: () {
                                    Get.to(const GetNewsView(
                                      text: "Religion",
                                    ));
                                  },
                                ),
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/weather.png",
                                    scale: 30,
                                  ),
                                  text: 'Weather',
                                  onTap: () {
                                    Get.to(const GetNewsView(
                                      text: "Weather",
                                    ));
                                  },
                                ),
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/horoscope.png",
                                    scale: 30,
                                  ),
                                  text: 'Horoscope',
                                  onTap: () {
                                    Get.to(const GetNewsView(
                                      text: "Horoscope",
                                    ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                const Divider(
                  color: AppColor.redColor,
                  height: 5,
                  thickness: 1.3,
                  indent: 1,
                  endIndent: 1,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                ///////////////////////// Button View /////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: '  Watch News',
                      ontap: () {},
                    ),
                    CustomButton(
                      text: '     TV Shows',
                      ontap: () {
                        Get.toNamed(RouteName.tvShowsView);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                const Divider(
                  color: AppColor.redColor,
                  height: 5,
                  thickness: 1.3,
                  indent: 1,
                  endIndent: 1,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Image.asset(
                  "assets/images/mac.png",
                  height: Get.height * 0.15,
                ),
              ],
            ),

            ///////////////////////// Bottom Navigation Bar View /////////////////////////

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    ImageAssets.bottomAppBarCorner,
                    height: 38,
                    width: 38,
                  ),
                ),
                CustomBottomNavBar(
                  title: 'اردو',
                  ontap: () {
                    Get.toNamed(RouteName.urduView);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
