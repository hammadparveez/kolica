import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolica/app_components/constants.dart';
import 'dart:ui';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:get/get.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:flutter/widgets.dart';
import 'package:kolica/Route/Route.dart';
import 'package:kolica/Widgets/GridAnimation.dart';
import 'package:kolica/ui_components/default_button.dart';
import 'package:kolica/app_components/AppConstant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolica/ui/category/Items_details/item_details_screen.dart';

class AddNewCardBody extends StatefulWidget {
  @override
  _AddNewCardBodyState createState() => _AddNewCardBodyState();
}

class _AddNewCardBodyState extends State<AddNewCardBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          bankCardItem(),
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, .0),
              child: Row(
                children: [
                  Text(
                    'Add Card Details Info',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          ),
          //TitleWithClearAllBtn(text: "Today", press: () {}),
          SizedBox(
            height: 5,
          ),
          NewCardDetailsView(context),
        ],
      ),
    );
  }
}

Widget NewCardDetailsView(context) {
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    children: [
      Container(
        padding: EdgeInsets.all(Dimension.Padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: kSubTextColor),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: kSubTextColor.withOpacity(.3)))),
              child: TextField(
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
                cursorColor: Colors.black,
                inputFormatters: [],
                decoration: InputDecoration(
                    /*suffixIcon: Icon(
                      Icons.check_circle,
                      size: 25,
                      color: Colors.black,
                    ),*/
                    border: InputBorder.none,
                    hintText: "Maria Hernandez",
                    hintStyle: TextStyle(color: kTextColor, fontSize: 18)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Number',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: kSubTextColor),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: kSubTextColor.withOpacity(.3)))),
              child: TextField(
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
                cursorColor: Colors.black,
                inputFormatters: [],
                decoration: InputDecoration(
                    /*suffixIcon: Icon(
                      Icons.check_circle,
                      size: 25,
                      color: Colors.black,
                    ),*/
                    border: InputBorder.none,
                    hintText: "0000 - 0000 - 0000 - 0000",
                    hintStyle: TextStyle(color: kTextColor, fontSize: 18)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expaire Date',
                              textDirection: TextDirection.ltr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: kSubTextColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: kSubTextColor.withOpacity(.3)))),
                        child: TextField(
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context).textTheme.headline1,
                          cursorColor: Colors.black,
                          inputFormatters: [],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "mm/yy",
                              hintStyle:
                                  TextStyle(color: kTextColor, fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVC',
                              textDirection: TextDirection.ltr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: kSubTextColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: kSubTextColor.withOpacity(.3)))),
                        child: TextField(
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context).textTheme.headline1,
                          cursorColor: Colors.black,
                          inputFormatters: [],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "+096 987 56 789",
                              hintStyle:
                                  TextStyle(color: kTextColor, fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: DefaultButton(
          text: "Save",
          press: () {
            //Navigator.pushNamed(context, CartSummaryScreen.routeName);
            Get.toNamed(MAIN_PAGE);
          },
        ),
      ),
    ],
  );
}

Widget bankCardItem() {
  double width = Get.width * 0.4;
  return Container(
    height: Get.height * 0.26,
    margin: EdgeInsets.only(top: Dimension.Size_5),
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: 4,
      itemBuilder: (context, index) {
        return GridAnimation(
          column: 3,
          index: index,
          child: Container(
            width: width,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(
                left: Dimension.Size_10,
                right: 3 == index ? Dimension.Size_10 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.Size_8),
              boxShadow: Themes.defaultShadow,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/card$index.svg',
                        width: width,
                        height: Get.height * 0.26,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
