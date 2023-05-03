import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../res/colors/colors.dart';
import '../home/home_view.dart';
import 'menu_view.dart';

class ZoomDrawerView extends StatelessWidget {
  const ZoomDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        mainScreen: const HomeView(),
        menuScreen: const MenuView(),
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        borderRadius: 10,
        showShadow: true,
        mainScreenTapClose: true,
        menuScreenWidth: 400,
        clipMainScreen: true,
        angle: 0,
        drawerShadowsBackgroundColor: AppColor.drakerColor,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }
}
