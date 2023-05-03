import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../firebase/news/urdu_news_view.dart';
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
import '../home/home_view.dart';

class UrduView extends StatefulWidget {
  const UrduView({super.key});

  @override
  State<UrduView> createState() => _UrduViewState();
}

class _UrduViewState extends State<UrduView> {
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
            .child("تمام خبریں")
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
          appBar: const CustomAppBar(title: "وائس نیوز"),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
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
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: Get.height * 0.28,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: AppColor.redColor),
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
                                text: ' نیوز ہیڈ لائنز',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'نیوز ہیڈ لائنز',
                                    text: 'نیوز ہیڈ لائنز',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/currentaffairs.png",
                                  scale: 6,
                                ),
                                text: 'حالات حاضرہ',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'حالات حاضرہ',
                                    text: 'حالات حاضرہ',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/sports.png",
                                  scale: 6,
                                ),
                                text: 'کھیل',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'کھیل',
                                    text: 'کھیل',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/international.png",
                                  scale: 6,
                                ),
                                text: 'بین اقوامی',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'بین اقوامی',
                                    text: 'بین اقوامی',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/entertiament.png",
                                  scale: 6,
                                ),
                                text: 'تفریح',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'تفریح',
                                    text: 'تفریح',
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
                                text: 'کاروبار',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'کاروبار',
                                    text: 'کاروبار',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/politics.png",
                                  scale: 30,
                                ),
                                text: 'سیاست',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'سیاست',
                                    text: 'سیاست',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/health.png",
                                  scale: 30,
                                ),
                                text: 'صحت',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'صحت',
                                    text: 'صحت',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/technology.png",
                                  scale: 35,
                                ),
                                text: 'ٹیکنالوجی',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'ٹیکنالوجی',
                                    text: 'ٹیکنالوجی',
                                  ));
                                },
                              ),
                              IconsContainerWidget(
                                image: Image.asset(
                                  "assets/images/crime.png",
                                  scale: 30,
                                ),
                                text: 'جرائم',
                                onTap: () {
                                  Get.to(const CenterUrduNewsView(
                                    reftext: 'جرائم',
                                    text: 'جرائم',
                                  ));
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 75),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/education.png",
                                    scale: 30,
                                  ),
                                  text: 'تعلیم',
                                  onTap: () {
                                    Get.to(const CenterUrduNewsView(
                                      reftext: 'تعلیم',
                                      text: 'تعلیم',
                                    ));
                                  },
                                ),
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/religion.png",
                                    scale: 30,
                                  ),
                                  text: 'مذہب',
                                  onTap: () {
                                    Get.to(const CenterUrduNewsView(
                                      reftext: 'مذہب',
                                      text: 'مذہب',
                                    ));
                                  },
                                ),
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/weather.png",
                                    scale: 30,
                                  ),
                                  text: 'موسم',
                                  onTap: () {
                                    Get.to(const CenterUrduNewsView(
                                      reftext: 'موسم',
                                      text: 'موسم',
                                    ));
                                  },
                                ),
                                IconsContainerWidget(
                                  image: Image.asset(
                                    "assets/images/horoscope.png",
                                    scale: 30,
                                  ),
                                  text: 'زائچہ',
                                  onTap: () {
                                    Get.to(const CenterUrduNewsView(
                                      reftext: 'زائچہ',
                                      text: 'زائچہ',
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
                  height: Get.height * 0.02,
                ),
                const Divider(
                  color: AppColor.redColor,
                  thickness: 1.3,
                  indent: 1,
                  endIndent: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: "خبریں دیکھیں",
                      ontap: () {},
                    ),
                    CustomButton(
                      text: "  ٹی وی شو  ",
                      ontap: () {
                        Get.toNamed(RouteName.tvShowsView);
                      },
                    ),
                  ],
                ),
                const Divider(
                  color: AppColor.redColor,
                  thickness: 1.3,
                  indent: 1,
                  endIndent: 1,
                ),
                const Spacer(),
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
                      title: 'English',
                      ontap: () {
                        Get.toNamed(RouteName.homeView);
                      },
                    ),
                  ],
                )
              ])),
    );
  }
}
