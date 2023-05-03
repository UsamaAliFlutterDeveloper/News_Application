import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors/colors.dart';
import '../../../routes/routes_name.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const CustomBottomNavBar(
      {super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: AppColor.redColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(35))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(RouteName.chiewePlayerView);
                },
                icon: const Icon(
                  Icons.live_tv_outlined,
                  color: AppColor.whiteColor,
                  size: 30,
                ),
              ),
              const VerticalDivider(
                color: AppColor.whiteColor,
                width: 10,
                thickness: 1.5,
                indent: 10,
                endIndent: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.heart,
                  color: AppColor.whiteColor,
                  size: 30,
                ),
              ),
              Container(
                  height: 40,
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.whiteColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(RouteName.webView);
                      },
                      icon: const Icon(
                        Icons.home,
                        size: 25,
                        color: AppColor.redColor,
                      ))),
              IconButton(
                  onPressed: () {
                    Get.toNamed(RouteName.welcomeView);
                  },
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                    color: AppColor.whiteColor,
                  )),
              const VerticalDivider(
                color: AppColor.whiteColor,
                width: 10,
                thickness: 1.5,
                indent: 10,
                endIndent: 10,
              ),
              GestureDetector(
                  onTap: ontap,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
