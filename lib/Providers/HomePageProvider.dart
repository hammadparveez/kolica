import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolica/Class/Recommended.dart';
import 'package:kolica/Class/TodayDeal.dart';
import 'package:kolica/Class/TrandingShop.dart';


class HomePageProvider with ChangeNotifier {

  bool Loading = true;
  List<TodayDeal> todayDeal=TodayDeal.todaydeals;
  List<Recommended> recommended=Recommended.recommendeds;
  List<TrendingShop> trendingShop=TrendingShop.trendingShops;
  List<TrendingShop> allShop=TrendingShop.allShop;

  List category=['All','Grocery','Fruit','Vegetables','Soap'];

  @override
  void dispose() {
    super.dispose();
  }



 /* Future getData() async {
    Loading = true;
    notifyListeners();
    await Api_Client.Request(context,
        url: URL.Get_Restaurant, onSuccess: (data) {}, onError: (data) {});
    Loading = false;
    notifyListeners();
  }*/
}
