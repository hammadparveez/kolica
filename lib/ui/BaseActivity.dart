import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolica/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/ui/notification/notification_screen.dart';
import 'package:kolica/Widgets/DefaultAppbar.dart';
import 'package:kolica/Widgets/TopShape.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class BaseActivity extends StatefulWidget {
  String title;
  bool returnData = false;
  Widget action;
  Color color;
  Widget body;
  Widget bottomNavigationBar;
  Widget leading;
  bool automaticLeading;

  BaseActivity(
      {@required this.title,
      @required this.body,
      this.returnData,
      this.action,
      this.color,
      this.bottomNavigationBar,
      this.leading,
      this.automaticLeading = true});

  @override
  _BaseActivityState createState() => _BaseActivityState();
}

class _BaseActivityState extends State<BaseActivity> {
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit an App'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned.fill(
              child: Container(
                color: Colors.white,
                  width: Get.width,
                  height: Get.height,
                  padding: EdgeInsets.only(
                      top: paddingTop + ((Get.height * 0.2) * 0.2)),
                  child: widget.body)),
          Positioned(
              top: 0,
              width: Get.width,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/header.png',
                    height: Get.height * 0.15,
                    width: Get.width,
                    fit: BoxFit.fill,
                    color: Themes.Primary,
                  ),
                  Positioned(
                      top: paddingTop,
                      width: Get.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: Dimension.Size_5,
                          ),
                          Opacity(
                            opacity: widget.automaticLeading ? 1 : 0,
                            child: widget.leading ??
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                  onPressed: widget.automaticLeading
                                      ? () {
                                          Get.back(result: widget.returnData);
                                        }
                                      : null,
                                ),
                          ),
                          Expanded(
                              child: Text(
                            widget.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: Themes.White,
                                    fontSize: Dimension.Size_20,
                                    fontWeight: Dimension.textMedium),
                            textAlign: TextAlign.center,
                          )),

                          /*widget.action != null
                              ? widget.action
                              : SizedBox(
                                  width: Get.width * 0.1,
                                )*/
                          widget.action != null
                              ? widget.action
                              :
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
                      ))
                ],
              ))
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
