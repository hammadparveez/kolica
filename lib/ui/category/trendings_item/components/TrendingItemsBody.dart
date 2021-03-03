import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolica/app_components/constants.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/app_components/AppConstant.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/Widgets/GridAnimation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/widgets.dart';

class TrendingItemsBody extends StatefulWidget {
  @override
  _TrendingItemsBodyState createState() => _TrendingItemsBodyState();
}

class _TrendingItemsBodyState extends State<TrendingItemsBody> {
  String dropdownDeliveryToValue;

  final List<String> dropdownNameList = <String>[
    "High to Low price",
    "Low to High price",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          allCategory(),
          SizedBox(
            height: 15,
          ),
          //trendingItem(),
          priceFilter(),
          SizedBox(
            height: 10,
          ),
          //trendingItem3(),
          //trendingItem2(),
          trendingItems(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  priceFilter() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kItemBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
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
        items: dropdownNameList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              width: 260,
              child: Text(
                value,
                style: TextStyle(
                    color: Themes.Primary,
                    fontSize: Dimension.Text_Size_Small,
                    fontWeight: FontWeight.normal),
                //style: Theme.of(context).textTheme.headline4,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
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
        padding:
        EdgeInsets.only(left: Dimension.Size_30, right: Dimension.Size_30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimension.Size_24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: Dimension.Size_10,
              offset: Offset(0, Dimension.Size_5), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          e,
          style: TextStyle(
              fontSize: Dimension.Text_Size,
              fontWeight: Dimension.textMedium,
              color: Themes.White),
        ),
      ),
    ],
  );
}


Widget trendingItems() {
  //double width = Get.width * 0.4;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/demo/trending0.png',
                        width: 150,
                        height: Get.height * 0.20,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Ripe Pomegranates',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/demo/trending1.png',
                      width: 150,
                      height: Get.height * 0.20,
                      fit: BoxFit.contain,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Ripe Pomegranates',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      SizedBox(width: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/demo/recomended2.png',
                      width: 150,
                      height: Get.height * 0.20,
                      fit: BoxFit.contain,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Green Apple',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/demo/recomended3.png',
                      width: 150,
                      height: Get.height * 0.20,
                      fit: BoxFit.contain,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Ripe Pomegranates',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      SizedBox(width: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/demo/trending0.png',
                      width: 150,
                      height: Get.height * 0.20,
                      fit: BoxFit.contain,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Ripe Pomegranates',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/demo/trending1.png',
                      width: 150,
                      height: Get.height * 0.20,
                      fit: BoxFit.contain,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Ripe Pomegranates',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      SizedBox(width: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/demo/recomended2.png',
                      width: 150,
                      height: Get.height * 0.20,
                      fit: BoxFit.contain,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Green Apple',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            height: Get.height * 0.30,
            width: Get.width * 0.44,
            margin: EdgeInsets.only(top: Dimension.Size_5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/demo/recomended3.png',
                      width: 150,
                      height: Get.height * 0.20,
                      fit: BoxFit.contain,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                //'Ripe Pomegranates',
                                'Ripe Pomegranates',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.Text_Size_Small_Extra),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small_Extra),
                                      children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: Dimension.Text_Size_Small_Extra),
                                        text: 'kg')
                                  ])),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-fill-color.svg',
                                  height: Dimension.Size_16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      SizedBox(width: 10,),
    ],
  );
}