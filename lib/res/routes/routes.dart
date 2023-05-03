import 'package:get/get.dart';
import 'package:voicenews/view/shows/tv_shows_view.dart';
import 'package:voicenews/view/signin/signin_view.dart';
import 'package:voicenews/view/splash/splash_view.dart';
import 'package:voicenews/view/welcome/welcome_view.dart';
import '../../view/chieweplayer/chiewe_player_view.dart';
import '../../view/home/home_view.dart';
import '../../view/signup/signup_view.dart';
import '../../view/urdu/urdu_view.dart';
import '../../view/webview/web_view.dart';
import '../../view/zoomdrawer/zoom_drawer_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.signInView,
          page: () => const SignInView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.signUpView,
          page: () => const SignUpView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.webView,
          page: () => const WebView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.chiewePlayerView,
          page: () => const ChiewePlayerView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.zoomDrawerView,
          page: () => const ZoomDrawerView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.welcomeView,
          page: () => const WelcomeView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.tvShowsView,
          page: () => const TvShowsView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.urduView,
          page: () => const UrduView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
