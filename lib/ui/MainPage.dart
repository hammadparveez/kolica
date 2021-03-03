import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/Packege/BottomTab/BottomTab.dart';
import 'package:kolica/Route/Route.dart';
import 'package:kolica/app_components/constants.dart';
import 'package:kolica/Packege/NavigationDrawer/CustomDrawer.dart';
import 'package:kolica/Providers/MainPageProvider.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/app_components/AppConstant.dart';
import 'package:kolica/ui/category/category_screen.dart';
import 'package:kolica/ui/favorite_items/favorite_items_screen.dart';
import 'package:kolica/ui/message/message_screen.dart';
import 'package:kolica/ui/search/search_screen.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import '../main.dart';
import 'BaseActivity.dart';
import 'HomePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  MainPageProvider provider;

  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainPageProvider>(
      create: (_) => MainPageProvider()..setController(this),
      child: Consumer<MainPageProvider>(
        builder: (context, model, child) {
          provider = model;
          return CustomDrawer(
            body: BaseActivity(
              title: language.Main_Page_Tab[provider.selectedTab],
              automaticLeading: false,
              body: openTabView(), //mainView(),
              bottomNavigationBar: Container(
                padding: EdgeInsets.all(Dimension.Size_5),
                decoration: BoxDecoration(
                  color: Themes.White,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimension.Padding2),
                      topLeft: Radius.circular(Dimension.Padding2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: Dimension.Size_30,
                      offset: Offset(
                          0, Dimension.Padding2), // changes position of shadow
                    ),
                  ],
                ),
                child: BottomTab(
                  currentIndex: provider.selectedTab,
                  onTap: provider.handleIndexChanged,
                  items: language.Main_Page_Tab.asMap()
                      .map((index, value) => MapEntry(
                          index,
                          BottomTabItem(
                            icon: SvgPicture.asset(
                              'assets/icons/home-tab$index.svg',
                              color: Themes.Primary,
                              height: Dimension.Size_20,
                            ),
                            title: Text(
                              value,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Themes.Primary),
                            ),
                            selectedColor: Themes.Primary,
                          )))
                      .values
                      .toList(),
                ),
              ),
            ),
            drawer: buildDrawerNav(),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return TabBarView(
      controller: provider.tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        CategoryScreen(),
        FavoriteItemsScreen(),
        SearchScreen(),
        MessageScreen(),
      ],
    );
  }

  Widget openTabView() {
    if (provider.selectedTab == 0) {
      return HomePage();
    } else if (provider.selectedTab == 1) {
      return CategoryScreen();
    } else if (provider.selectedTab == 2) {
      return FavoriteItemsScreen();
    } else if (provider.selectedTab == 3) {
      return SearchScreen();
    } else if (provider.selectedTab == 4) {
      return MessageScreen();
    }
  }
}

// Navigtion Drawer
class buildDrawerNav extends StatelessWidget {
  const buildDrawerNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDrawerPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/profile/profile.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Maria Hernandez',
                style: TextStyle(
                    fontSize: kDrawerFontSize,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConstant.font_mukta),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
/*                    InkWell(
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(MAIN_PAGE);
                      },
                    ),*/
                    InkWell(
                      child: Text(
                        'Order History',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(ORDER_HISTORY_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Add Location',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        //Get.toNamed(LOCATION_PERMISSION);
                        Get.toNamed(ADD_LOCATION_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Add Payment Card',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(ADD_NEW_CARD_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(PROFILE_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Order Track',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(ORDER_TRACK_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(SETTINGS_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Help Center',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(HELP_CENTER_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Term & Condition',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(TERMS_AND_CONDITION_SCREEN);
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                            fontSize: 16,
                            height: kDrawerFontSizeHeight,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstant.font_mukta),
                      ),
                      onTap: () {
                        Get.toNamed(AUTHENTICATION);
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
