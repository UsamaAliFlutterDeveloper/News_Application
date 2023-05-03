import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/images.dart';
import '../../res/colors/colors.dart';
import '../../res/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Get.toNamed(RouteName.zoomDrawerView));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                height: Get.height * 0.30,
                width: Get.width * 0.30,
                child: Image.asset(ImageAssets.splashScreen),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Powered By : A2Z Media Solution",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.redColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
