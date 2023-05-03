import 'package:url_launcher/url_launcher.dart';

class AppUrl {
  Future<void> launchURL() async {
    const url = 'https://voicenewspk.com/';

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> youtubeLaunchURL() async {
    const url = 'https://www.youtube.com/@voicenewspk';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> facebookLaunchURL() async {
    const url = 'https://www.facebook.com/VoiceNewsPk';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> googlePlayLaunchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.voice.voicenews';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> privacypolicyLaunchURL() async {
    const url = 'https://voicenewspk.com/privacy-policy/';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
