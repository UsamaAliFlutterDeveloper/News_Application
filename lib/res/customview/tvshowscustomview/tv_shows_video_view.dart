import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicenews/res/colors/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../model/tv_shows_video_model.dart';
import '../../components/widgets/appbar/custom_app_bar.dart';

class TvShowsVideoView extends StatelessWidget {
  final String reftext;

  const TvShowsVideoView({
    Key? key,
    required this.reftext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TvShowsVideoModel> news0 = [];

    /// The Method to get Data from Firebase Realtime using Model
    Future<List<TvShowsVideoModel>?> getTvShows() async {
      List<TvShowsVideoModel> news = [];
      try {
        DatabaseEvent newsSnapShot = await FirebaseDatabase.instance

            // ignore: deprecated_member_use
            .reference()
            .child("Shows Data")
            .child(reftext)
            .orderByChild('time')
            .once();

        if (newsSnapShot.snapshot.value != null) {
          Map<dynamic, dynamic> values =
              newsSnapShot.snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, value) {
            TvShowsVideoModel tvShowsModel = TvShowsVideoModel.fromJson(value);
            news.add(tvShowsModel);
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
        appBar: CustomAppBar(
          title: reftext,
        ),
        body: FutureBuilder<List<TvShowsVideoModel>?>(
            future: getTvShows(),
            builder:
                (context, AsyncSnapshot<List<TvShowsVideoModel>?> snapshot) {
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
                      itemBuilder: (BuildContext context, int index) {
                        TvShowsVideoModel shows = news0[index];
                        final youtubeLink = shows.link;
                        final controller = YoutubePlayerController(
                            initialVideoId:
                                YoutubePlayer.convertUrlToId(youtubeLink!)!,
                            flags: const YoutubePlayerFlags(
                              autoPlay: true,
                              mute: false,
                            ));
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color: AppColor.greyColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 90,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.redColor, width: 2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18)),
                                    child: shows.image1 == null
                                        ? Container(
                                            height: 90,
                                            width: 130,
                                            color: AppColor.greyColor,
                                          ) // return an empty container if image1 is null
                                        : Image.network(
                                            shows.image1.toString(),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 110,
                                  width: 185,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Text(
                                          shows.time.toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: AppColor.redColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        shows.name.toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: AppColor.greyColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () async {
                                      Get.dialog(
                                        AlertDialog(
                                          elevation: 0,
                                          insetPadding:
                                              const EdgeInsets.all(15),
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                          backgroundColor: AppColor.redColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          content: YoutubePlayer(
                                            showVideoProgressIndicator: true,
                                            progressIndicatorColor:
                                                AppColor.redColor,
                                            progressColors:
                                                const ProgressBarColors(
                                              playedColor: AppColor.redColor,
                                              handleColor: AppColor.redColor,
                                            ),
                                            controller: controller,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.play_circle_outline_outlined,
                                      color: AppColor.redColor,
                                      size: 35,
                                    ))
                              ],
                            ),
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
            }),
      ),
    );
  }
}
