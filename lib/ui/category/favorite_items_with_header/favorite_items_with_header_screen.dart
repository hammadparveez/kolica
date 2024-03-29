import 'package:flutter/material.dart';
import 'components/FavoriteItemsHeaderBody.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kolica/ui/category/favorite_items_with_header/components/FavoriteItemsHeaderBody.dart';
import 'package:kolica/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/app_components/constants.dart';
import 'package:kolica/ui/notification/notification_screen.dart';

class FavoriteItemsWithHeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text("Favorite Items"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/cart_white.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/notification.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: FavoriteItemHeaderBody(),
    );
  }
}
