import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:voicenews/res/assets/images.dart';
import 'package:voicenews/res/colors/colors.dart';
import 'package:voicenews/res/components/widgets/text/text_widget.dart';
import 'package:voicenews/res/routes/routes_name.dart';

import '../../res/components/widgets/button/round_button_widget.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List<Map<String, String>> images = [
    {
      'url': 'assets/images/newspaper.png',
      'caption': 'News Paper',
    },
    {
      'url': 'assets/images/livestream.png',
      'caption': 'Live Stream',
    },
    {
      'url': 'assets/images/latestnews.png',
      'caption': 'Latest News',
    },
  ];

  @override
  Widget build(BuildContext context) {
    {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.lightgreyColor,
          body: Stack(
            children: [
              Image.asset(ImageAssets.topWelcomeViewImage),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                    items: images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                image['caption']!,
                                style: const TextStyle(
                                  color: AppColor.redColor,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                image['url']!,
                                height: 150.0,
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10.0),
                  customText(
                      "There's a lot of flexibility when it comes to writing \nparagraphs, but if there's one steadfast rule, it's this:\nParagraphs should relate to one main topic or point.",
                      true),
                  const Spacer(),
                  RoundButton(
                    onPress: () {
                      Get.toNamed(RouteName.signInView);
                    },
                    title: ' GET STARTED !',
                    height: Get.height * 0.06,
                    width: Get.width * 0.9,
                    textColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
