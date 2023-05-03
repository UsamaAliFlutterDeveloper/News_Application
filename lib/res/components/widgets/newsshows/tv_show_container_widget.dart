import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicenews/res/colors/colors.dart';

class TvShowContainer extends StatelessWidget {
  final String text;
  final Image image;
  const TvShowContainer({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Container(
            height: Get.height * 0.07,
            width: Get.width * 2.0,
            decoration: const BoxDecoration(
                color: AppColor.redColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 110,
            width: 180,
            decoration: const BoxDecoration(
                color: AppColor.greyColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: image),
          ),
        ),
      ],
    );
  }
}
