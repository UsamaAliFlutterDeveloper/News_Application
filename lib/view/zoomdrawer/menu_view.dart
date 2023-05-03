import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:voicenews/res/routes/routes_name.dart';
import '../../firebase/news/get_news_view.dart';
import '../../res/app_url/url_launcher.dart';
import '../../res/assets/images.dart';
import '../../res/colors/colors.dart';
import '../../res/components/widgets/text/text_widget.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    final appUrl = Get.put(AppUrl());
    return Scaffold(
      backgroundColor: AppColor.greyColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(ImageAssets.logoVoiceNews),
              scale: 2,
            )),
            child: Text(""),
          ),
          ListTile(
            leading: const Icon(
              Icons.autorenew,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("All News", false),
            onTap: () {
              Get.to(const GetNewsView(
                text: 'All News',
              ));
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.play_circle,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Watch News", false),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.apps,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Tv Shows", false),
            onTap: () {
              Get.toNamed(RouteName.tvShowsView);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.arrow_clockwise_circle_fill,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("اردو", false),
            onTap: () {
              Get.toNamed(RouteName.urduView);
            },
          ),

          const Divider(
            color: AppColor.whiteColor,
            height: 5,
            thickness: 0.5,
            indent: 1,
            endIndent: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          customText("   App Content", false),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.heart,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Favorites", false),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Share", false),
            onTap: () {
              Share.share('Share');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.policy,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Privacy Policy", false),
            onTap: () {
              appUrl.privacypolicyLaunchURL();
            },
          ),
          const Divider(
            color: AppColor.whiteColor,
            height: 5,
            thickness: 0.5,
            indent: 1,
            endIndent: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          customText("  Communicate", false),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.globe,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Website", false),
            onTap: () {
              appUrl.launchURL();
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.play,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("YouTube", false),
            onTap: () {
              appUrl.youtubeLaunchURL();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.group,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Facebook", false),
            onTap: () {
              appUrl.facebookLaunchURL();
            },
          ),
          const Divider(
            color: AppColor.whiteColor,
            height: 5,
            thickness: 0.5,
            indent: 1,
            endIndent: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          customText("  Motivation", false),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.feedback,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Feedback", false),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.checkmark_rectangle_fill,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Suggestions", false),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.star_fill,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Rating", false),
            onTap: () {
              appUrl.googlePlayLaunchURL();
            },
          ),
          ///////
          const Divider(
            color: AppColor.whiteColor,
            height: 5,
            thickness: 0.5,
            indent: 1,
            endIndent: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          customText("  Voice News", false),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.all_inclusive_outlined,
              color: AppColor.whiteColor,
              size: 25,
            ),
            title: customText("Join Voice News", false),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
