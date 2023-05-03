import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../assets/images.dart';
import '../../../colors/colors.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 60.0;
  final String title;
  final bool icon;
  const SearchAppBar({super.key, required this.title, this.icon = false});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        leading: icon == true
            ? IconButton(
                onPressed: () {
                  ZoomDrawer.of(context)?.toggle();
                },
                icon: const Icon(Icons.menu))
            : IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.chevron_left)),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColor.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.redColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
        flexibleSpace: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              top: 58.8,
              child: Image.asset(
                ImageAssets.topAppBarCorner,
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
