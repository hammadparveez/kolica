import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolica/ui/order/order_history/tabs/TabOngoingOrderScreen.dart';
import 'package:kolica/app_components/constants.dart';
import 'package:kolica/app_components/StyleScheme.dart';
import 'package:kolica/ui/order/order_history/tabs/TabPastOrderScreen.dart';
import 'package:kolica/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/ui/notification/notification_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                title: Text("Order History"),
                forceElevated: innerBoxIsScrolled,
                snap: false,
                pinned: true,
                floating: false,
                flexibleSpace: Container(
                  height: 100,
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
                          MaterialPageRoute(
                              builder: (context) => CartSummaryScreen()),
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
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()),
                        );
                      },
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(75),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TabBar(
                          indicatorColor: kPrimaryColor2,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 3,
                          labelColor: kTextColor,
                          labelStyle: tabHeadingStyle,
                          tabs: <Tab>[
                            Tab(
                                text: "Ongoing Order",
                                icon: Icon(Icons.border_inner_rounded)),
                            Tab(
                                text: "Past Order",
                                icon: Icon(Icons.card_membership_sharp)),
                          ]),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              TabOngoingOrderScreen(),
              TabPastOrderScreen(),
              //MyVoucherAllScreen(),
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
  }
}
