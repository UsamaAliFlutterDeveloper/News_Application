import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/components/widgets/appbar/custom_app_bar.dart';
import '../../res/components/widgets/news/all_news_container_widget.dart';
import '../../res/customview/news_description_view.dart';

class CenterUrduNewsView extends StatefulWidget {
  final String reftext;
  final String text;
  const CenterUrduNewsView({
    super.key,
    required this.reftext,
    required this.text,
  });

  @override
  State<CenterUrduNewsView> createState() => _CenterUrduNewsViewState();
}

class _CenterUrduNewsViewState extends State<CenterUrduNewsView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("News").child(widget.reftext);
    return SafeArea(
        // ignore: sort_child_properties_last
        child: Scaffold(
            appBar: CustomAppBar(
              title: widget.reftext,
            ),
            body: StreamBuilder(
              stream: ref.orderByChild("time").onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<dynamic> list = [];
                  if (snapshot.data != null &&
                      snapshot.data!.snapshot.value != null) {
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    list = map.entries.toList();
                    list.sort(
                        (a, b) => b.value["time"].compareTo(a.value["time"]));
                  }
                  return ListView.builder(
                    itemCount: list.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.offAll(
                            NewsDescriptionView(
                              category: list[index].value["category"],
                              time: list[index].value["time"],
                              name: list[index].value["name"],
                              image: Image.network(
                                list[index].value["image1"],
                                fit: BoxFit.cover,
                              ),
                              des: list[index].value["des"],
                            ),
                          );
                        },
                        child: AllNewsContainer(
                          image1: Image.network(
                            list[index].value["image1"],
                            fit: BoxFit.cover,
                          ),
                          name: list[index].value["name"],
                          time: list[index].value["time"],
                        ),
                      );
                    },
                  );
                }
              },
            )));
  }
}
