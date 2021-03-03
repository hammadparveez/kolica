import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/app_components/AppConstant.dart';
import 'package:kolica/Widgets/DefaultAppbar.dart';
import 'package:kolica/ui/order/order_track/components/track_processing.dart';
import '../../Route/Route.dart';
import '../../main.dart';
import 'package:kolica/app_components/size_configue.dart';
import 'package:kolica/ui/RootPage.dart';

class SplashScreen extends StatefulWidget {
  //static String routeName = "/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    //Themes.Primary=Themes.getColorFromColorCode(appSetting.data.colors);
    var _duration = Duration(seconds: 1);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));

    Get.toNamed(ON_BOARDING);
    //Get.toNamed(MAIN_PAGE);
    //Get.toNamed(CART_SCREEN);
    //Get.toNamed(TODAYS_DEAL_SCREEN);
    //Get.toNamed(TRENDING_ITEM_SCREEN);
    //Get.toNamed(ITEM_DETAILS_SCREEN);
    //Get.toNamed(FOLLOWED_SHOP_SCREEN);
    //Get.toNamed(RECOMMENDED_ITEM_SCREEN);
    //Get.toNamed(MESSAGE_SCREEN);
    //Get.toNamed(SEARCH_SCREEN);
    //Get.toNamed(ROOT_PAGE);
    //Get.to(TrackProcessingWidget());
    //Get.toNamed(TAKE_PHONE_NUMBER);
    //Get.toNamed(LOCATION_PERMISSION);
    //Get.toNamed(CHECKOUT_SCREEN);
    //Get.toNamed(NOTIFICATION_SCREEN);
    //Get.toNamed(AUTHENTICATION);
    //Get.toNamed(PROFILE_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    paddingTop = MediaQuery.of(context).padding.top;
    paddingBottom = MediaQuery.of(context).padding.bottom;
    appbarHeight =
        DefaultAppbar(context: context, title: 'Demo').preferredSize.height;
    return Scaffold(
      backgroundColor: Themes.Primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            'assets/icons/logo.svg',
            width: Get.height * 0.2,
            fit: BoxFit.fill,
          )),
          Text(
            AppConstant.AppName,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: Dimension.Size_36, color: Themes.Primary2),
          ),
        ],
      ),
    );
  }
}
