import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolica/app_components/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kolica/ui/filter/filter_screen.dart';
import 'package:kolica/ui/category/trendings_item/trending_items_screen.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/Language/Language.dart';
import 'dart:ui';
import 'package:kolica/Widgets/GridAnimation.dart';

Language language = Language();

class CategoryBody extends StatefulWidget {
  @override
  _CategoryBodyState createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  String dropdownDeliveryToValue;

  final List<String> dropdownNameList = <String>[
    "California, United State",
    "LA, United State",
    "Miami, United State",
  ];

  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.only(
                  top:
                      invisibleHeight + Dimension.Size_100 + Dimension.Size_30),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    'Filter By  Category',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                allCategory(),
                SizedBox(
                  height: 10,
                ),
                trendingShop(0),
              ],
            ),
          ),
          Positioned(top: 0, width: Get.width, child: topMenu()),
        ],
      ),
    );
  }

  Widget topMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Themes.White,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimension.Size_5),
            bottomRight: Radius.circular(Dimension.Size_5)),
        boxShadow: Themes.defaultShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: Dimension.Size_80,
              padding: EdgeInsets.all(Dimension.Size_10),
              margin: EdgeInsets.all(Dimension.Padding)
                  .copyWith(top: invisibleHeight + Dimension.Size_24),
              decoration: BoxDecoration(
                  color: Themes.Card_Back_Blue_Lite,
                  borderRadius: BorderRadius.circular(Dimension.Size_3)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      'assets/icons/navigation.svg',
                      height: Dimension.Size_34,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      //margin: EdgeInsets.only(left: Dimension.Size_10, right: Dimension.Size_10),
                      margin:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding2),
                      //height: Dimension.Size_80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              language.Delivery_to,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Themes.Primary),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: DropdownButton<String>(
                              value: dropdownDeliveryToValue == null
                                  ? dropdownNameList[0]
                                  : dropdownDeliveryToValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 18,
                              iconDisabledColor: kBlueTextColor,
                              iconEnabledColor: kBlueTextColor,
                              style: TextStyle(color: kBlueTextColor),
                              underline: Container(
                                height: 0,
                                color: Colors.transparent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownDeliveryToValue = newValue;
                                });
                              },
                              items: dropdownNameList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          /*InkWell(
                            child: Row(
                              children: [
                                Text(
                                  'California, United State',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Themes.Primary,
                                )
                              ],
                            ),
                            onTap: () {},
                          ),*/
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
            child: Container(
              height: Dimension.Size_80,
              padding: EdgeInsets.all(Dimension.Size_10)
                  .copyWith(left: Get.width * 0.07, right: Get.width * 0.07),
              margin: EdgeInsets.all(Dimension.Padding)
                  .copyWith(top: invisibleHeight + Dimension.Size_24, left: 0),
              decoration: BoxDecoration(
                  color: Themes.Card_Back_Blue_Lite,
                  borderRadius: BorderRadius.circular(Dimension.Size_3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/filter.svg',
                    height: Dimension.Size_30,
                  ),
                  SizedBox(
                    height: Dimension.Size_5,
                  ),
                  Text(
                    language.Filter,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List category = ['All', 'Grocery', 'Fruit', 'Vegetables'];

  Widget allCategory() {
    return Container(
      height: Dimension.Size_70,
      margin: EdgeInsets.only(top: Dimension.Size_5),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        children: category
            .asMap()
            .map((index, e) => MapEntry(index, singleCategory(e, index)))
            .values
            .toList(),
      ),
    );
  }

  Widget singleCategory(String e, int index) {
    Color color = Themes.randomColor();
    return Column(
      children: [
        Container(
          height: Dimension.Size_50,
          margin: EdgeInsets.only(
              left: Dimension.Size_10,
              right: category.length - 1 == index ? Dimension.Size_10 : 0),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              left: Dimension.Size_30, right: Dimension.Size_30),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Dimension.Size_24),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: Dimension.Size_10,
                offset:
                    Offset(0, Dimension.Size_5), // changes position of shadow
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrendingItemsScreen()),
              );
            },
            child: Text(
              e,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: Dimension.textMedium, color: Themes.White),
            ),
          ),
        ),
      ],
    );
  }

/*  Widget trendingShop() {
    return Container(
      height: Get.height * 0.333,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        itemCount: TrendingShop.trendingShops.length,
        itemBuilder: (context, index) {
          return GridAnimation(
            index: index,
            column: TrendingShop.trendingShops.length,
            child: Container(
              //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
              width: Get.width * 0.3,
              margin: EdgeInsets.only(
                  left: Dimension.Size_10,
                  right: TrendingShop.trendingShops.length - 1 == index
                      ? Dimension.Size_10
                      : 0),
              decoration: BoxDecoration(
                //color: provider.trendingShop[index].color,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimension.Size_5),
                //boxShadow: Themes.defaultShadow,
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: TrendingShop.trendingShops[index].color,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          //color: provider.trendingShop[index].color,
                          child: Image.asset(
                            TrendingShop.trendingShops[index].image,
                            height: Get.height * 0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    TrendingShop.trendingShops[index].name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    TrendingShop.trendingShops[index].details,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: Dimension.Size_3,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/distance.svg',
                              height: Dimension.Size_16,
                            ),
                            SizedBox(
                              width: Dimension.Size_5,
                            ),
                            Text(
                              '${TrendingShop.trendingShops[index].distance} ${language.Km_Away}',
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/rating.svg',
                              height: Dimension.Size_16,
                            ),
                            SizedBox(
                              width: Dimension.Size_5,
                            ),
                            Text(
                              '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }*/

  Widget trendingShop(index) {
    //double width = Get.width * 0.4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                //width: 160,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[index].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[index].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                //width: 160,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[1].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[1].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[1].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[1].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].rating} (${TrendingShop.trendingShops[1].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[2].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[2].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[2].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[2].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[2].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[2].rating} (${TrendingShop.trendingShops[2].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[3].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[3].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[1].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[1].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[1].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[1].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].rating} (${TrendingShop.trendingShops[1].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[2].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[0].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[2].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[2].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].rating} (${TrendingShop.trendingShops[1].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[3].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[index].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: TrendingShop.trendingShops.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  //color: provider.trendingShop[index].color,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  boxShadow: Themes.defaultShadow,
                ),
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.Size_5),
                            topLeft: Radius.circular(Dimension.Size_5)),
                        color: TrendingShop.trendingShops[index].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              TrendingShop.trendingShops[index].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
/*
                    Flexible (
                      child: Text(
                        TrendingShop.trendingShops[index].details,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.Size_3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.Km_Away}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_12,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class TrendingShop {
  String image, name, details;
  int distance, totalRating;
  double rating;
  Color color;

  TrendingShop(
      {this.image,
      this.name,
      this.details,
      this.distance,
      this.totalRating,
      this.rating,
      this.color});

  static List<TrendingShop> trendingShops = [
    TrendingShop(
      image: 'assets/demo/trending-shop0.png',
      name: 'K & K Stationary',
      details: 'nulla ftum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG1,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop1.png',
      name: 'Giant Food Stores.',
      details: 'Aenan nulla tae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG5,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop2.png',
      name: 'Stationary K',
      details: 'Aenan  ferme ntum ve',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG2,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop3.png',
      name: 'K & K Stationary',
      details: 'ulla ferme ntum',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG3,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop4.png',
      name: 'K & K Stationary',
      details: 'Austo nulla ferum',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG4,
    ),
  ];
  static List<TrendingShop> allShop = [
    TrendingShop(
      image: 'assets/demo/shop0.png',
      name: 'Giant Food Stores.',
      details: 'Abf juerme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG5,
    ),
    TrendingShop(
        image: 'assets/demo/shop1.png',
        name: 'K & K Stationary',
        details: 'Qusto   ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop2.png',
        name: 'Giant Food Stores.',
        details: 'Zusto  ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop3.png',
        name: 'K & K Stationary',
        details: 'Aenan justo nulla',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop4.png',
        name: 'K & K Stationary',
        details: 'Msto nulla fe vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
  ];
}
