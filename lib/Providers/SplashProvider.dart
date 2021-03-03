import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolica/Language/AppLocalizations.dart';
import 'package:kolica/Route/Route.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/app_components/AppConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SplashProvider with ChangeNotifier {


  SplashProvider() {
    SharedPreferences.getInstance().then((pr) {
      prefs = pr;
      startTime();
    });
    /*if (Platform.isAndroid) {
      URL.device_type = AppConstant.Android;
    } else if (Platform.isIOS) {
      URL.device_type = AppConstant.iOS;
    }*/
  }


  startTime() async {
    //Themes.Primary=Themes.getColorFromColorCode(appSetting.data.colors);
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }


  void navigationPage() async {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    //Get.toNamed(ONBOARDING);
    Get.toNamed(ROOT_PAGE);
  }

}
