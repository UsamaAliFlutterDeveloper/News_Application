import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/news_model.dart';
import '../../res/components/widgets/appbar/search_app_bar.dart';
import '../../res/components/widgets/news/all_news_container_widget.dart';
import '../../res/customview/news_description_view.dart';

class GetNewsView extends StatelessWidget {
  final String text;
  const GetNewsView({super.key, required this.text});

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
            .child(text)
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
          appBar: SearchAppBar(
            title: text,
          ),
          body: FutureBuilder<List<NewsModel>?>(
            future: getNews(),
            builder: (context, AsyncSnapshot<List<NewsModel>?> snapshot) {
              try {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  news0 = snapshot.data!;
                  return ListView.builder(
                    itemCount: news0.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
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
                        child: AllNewsContainer(
                          image1: Image.network(
                            news.image1.toString(),
                            fit: BoxFit.cover,
                          ),
                          name: news.name.toString(),
                          time: news.time.toString(),
                        ),
                      );
                    },
                  );
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
          )),
    );
  }
}
