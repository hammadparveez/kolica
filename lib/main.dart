import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kolica/app_components/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:kolica/Widgets/ListScrollBehavior.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Language/Language.dart';
import 'Providers/SplashProvider.dart';
import 'Route/Route.dart';
//import 'package:kolica/app_components/size_configue.dart';

Language language = Language();
SharedPreferences prefs;

double paddingTop, appbarHeight, screenRatio, paddingBottom;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SPLASH_SCREEN,
      defaultTransition: Transition.leftToRightWithFade,
      //defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ListScrollBehavior(),
          child: child,
        );
      },
      getPages: appRoutes(),
    );
  }
}

//bool get isEnglish => mainLocale == AppLocale.EN;
