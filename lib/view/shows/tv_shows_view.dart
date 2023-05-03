import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicenews/res/components/widgets/appbar/custom_app_bar.dart';
import '../../model/tv_shows_model.dart';
import '../../res/components/widgets/newsshows/tv_show_container_widget.dart';
import '../../res/customview/tvshowscustomview/tv_shows_video_view.dart';

class TvShowsView extends StatefulWidget {
  const TvShowsView({
    super.key,
  });

  @override
  State<TvShowsView> createState() => _TvShowsViewState();
}

class _TvShowsViewState extends State<TvShowsView> {
  @override
  Widget build(BuildContext context) {
    List<TvShowsModel> shows0 = [];

    Future<List<TvShowsModel>?> getTvShows() async {
      List<TvShowsModel> shows = [];
      try {
        DatabaseEvent newsSnapShot = await FirebaseDatabase.instance
            .ref("Shows")
            .child("All Shows")
            .once();

        if (newsSnapShot.snapshot.value != null) {
          Map<dynamic, dynamic> values =
              newsSnapShot.snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, value) {
            TvShowsModel tvShowModel = TvShowsModel.fromJson(value);
            shows.add(tvShowModel);
          });
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return null;
      }
      return shows;
    }

    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(title: "Tv Shows"),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<List<TvShowsModel>?>(
                future: getTvShows(),
                builder:
                    (context, AsyncSnapshot<List<TvShowsModel>?> snapshot) {
                  try {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      shows0 = snapshot.data!;
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                          ),
                          itemCount: shows0.length,
                          itemBuilder: (BuildContext context, int index) {
                            TvShowsModel shows = shows0[index];

                            return GestureDetector(
                              onTap: () {
                                Get.to(TvShowsVideoView(
                                  reftext: shows.name.toString(),
                                ));
                              },
                              child: TvShowContainer(
                                text: shows.name.toString(),
                                image: Image.network(
                                  shows.image1.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } catch (e) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )),
    );
  }
}
