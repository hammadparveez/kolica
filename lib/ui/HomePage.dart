import 'dart:ui';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/app_components/AppConstant.dart';
import 'package:kolica/app_components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/Providers/HomePageProvider.dart';
import 'package:kolica/Widgets/CustomBanner.dart';
import 'package:kolica/Widgets/GridAnimation.dart';
import 'package:provider/provider.dart';
import 'package:kolica/ui/category/todays_deal_details/todays_deal_details_screen.dart';
import 'package:kolica/ui/category/shop_details/shop_details_screen.dart';
import 'package:kolica/ui/category/trendings_item/trending_items_screen.dart';
import 'package:kolica/ui/category/recommemded_Items/recommended_items_screen.dart';
import 'package:kolica/ui/category/Items_details/item_details_screen.dart';
import 'package:kolica/ui/category/todays_deal/todays_deal_screen.dart';
import 'package:kolica/ui/category/trending_shop/trending_shop_screen.dart';
import 'package:kolica/ui/category/all_shop/all_shop_screen.dart';
import 'package:kolica/ui/filter/filter_screen.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: Theme.of(context).textTheme.headline1),
            content: Text('Do you want to exit an App?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No', style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.blue)),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child:
                    Text('Yes', style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }

  String dropdownDeliveryToValue;
  HomePageProvider provider;
  final List<String> dropdownNameList = <String>[
    "California, United State",
    "LA, United State",
    "Miami, United State",
  ];

  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (_) => HomePageProvider(),
      child: Consumer<HomePageProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            body: WillPopScope(onWillPop: _onWillPop, child: mainView()),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.only(
                  top:
                      invisibleHeight + Dimension.Size_100 + Dimension.Size_30),
              children: [
                slider(),
                allCategory(),
                titleHeader(
                    title: language.Trending_Item,
                    press: TrendingItemsScreen()),
                trendingItem(),
                titleHeader(
                    title: language.Today_Deal, press: TodaysDealScreen()),
                todayDeal(),
                titleHeader(
                    title: language.Recommended_Items,
                    press: RecommendedItemsScreen()),
                recommendedItem(),
                titleHeader(
                    title: language.Trending_Shop, press: TrendingShopScreen()),
                trendingShop(),
                titleHeader(title: language.All_Shop, press: AllShopScreen()),
                allShop(),
                SizedBox(
                  height: Get.height * 0.05,
                )
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
              height: 82,
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
              height: 82,
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

  Widget slider() {
    return CarouselSlider(
      options:
          CarouselOptions(height: Get.height * 0.21, viewportFraction: 0.9),
      items: [1, 2, 3, 4, 5].map((i) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
            );
          },
          child: Container(
            width: Get.width,
            margin: EdgeInsets.only(
                left: Dimension.Size_5,
                right: Dimension.Size_5,
                bottom: Dimension.Padding),
            decoration: BoxDecoration(
                color: Themes.White,
                borderRadius: BorderRadius.circular(Dimension.Size_10),
                boxShadow: Themes.defaultShadow,
                image: DecorationImage(
                    image: AssetImage('assets/demo/slider.png'),
                    fit: BoxFit.fill)),
          ),
        );
      }).toList(),
    );
  }

  Widget allCategory() {
    return Container(
      height: Dimension.Size_70,
      margin: EdgeInsets.only(top: Dimension.Size_5),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        children: provider.category
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
              right: provider.category.length - 1 == index
                  ? Dimension.Size_10
                  : 0),
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

  Widget titleHeader({String title, press}) {
    return Padding(
      padding: EdgeInsets.only(left: Dimension.Padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          )),
          FlatButton(
            onPressed: () {},
            child: InkWell(
              child: Text(
                language.See_All,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => press),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget trendingItem() {
    double width = Get.width * 0.4;
    return Container(
      height: Get.height * 0.30,
      margin: EdgeInsets.only(top: Dimension.Size_5),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GridAnimation(
            column: 3,
            index: index,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                width: width,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.only(
                    left: Dimension.Size_10,
                    bottom: Dimension.Padding,
                    right: 2 == index ? Dimension.Size_10 : 0),
                decoration: BoxDecoration(
                  color: Themes.White,
                  borderRadius: BorderRadius.circular(Dimension.Size_8),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/demo/trending$index.png',
                            width: width,
                            height: Get.height * 0.20,
                            fit: BoxFit.contain,
                          ),
                          Divider(
                            height: 2,
                            color: Themes.Grey.withOpacity(0.1),
                            thickness: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      //'Ripe Pomegranates',
                                      'Trending Items $index',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                              fontWeight: Dimension.textBold),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: RichText(
                                          text: TextSpan(
                                              text:
                                                  '${AppConstant.currencySymbol}120/ ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                              children: [
                                            TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    .copyWith(
                                                        color: Themes.Grey),
                                                text: 'kg')
                                          ])),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                          'assets/icons/cart-fill-color.svg',
                                          height: Dimension.Size_16,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: Container(
                          width: width,
                          padding: EdgeInsets.all(Dimension.Size_10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Themes.Primary2,
                                    borderRadius: BorderRadius.circular(
                                        Dimension.Size_5)),
                                padding: EdgeInsets.all(Dimension.Size_3)
                                    .copyWith(
                                        left: Dimension.Size_10,
                                        right: Dimension.Size_10),
                                child: Text(
                                  '30% ${language.Off}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: Themes.White,
                                          fontSize:
                                              Dimension.Text_Size_Small_Extra),
                                ),
                              ),
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
            ),
          );
        },
      ),
    );
  }

  Widget todayDeal() {
    return Container(
      height: Get.height * 0.265,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: provider.todayDeal.length,
        itemBuilder: (context, index) {
          return GridAnimation(
            index: index,
            column: provider.todayDeal.length,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TodaysDealDetailsScreen()),
                );
              },
              child: Container(
                width: Get.width * 0.4,
                margin: EdgeInsets.only(
                    left: Dimension.Size_10,
                    right: provider.todayDeal.length - 1 == index
                        ? Dimension.Size_10
                        : 0),
                decoration: BoxDecoration(
                  color: provider.todayDeal[index].color.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  //boxShadow: Themes.defaultShadow,
                ),
                clipBehavior: Clip.antiAlias,
                child: CustomBanner(
                  message:
                      "${AppConstant.currencySymbol} ${provider.todayDeal[index].price} ${language.Only}",
                  textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Themes.White,
                      fontSize: Dimension.Text_Size_Small_Extra),
                  color: provider.todayDeal[index].color,
                  location: CustomBannerLocation.topEnd,
                  layoutDirection: TextDirection.rtl,
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(
                                provider.todayDeal[index].image,
                                height: Get.height * 0.15,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Divider(
                              height: 2,
                              color: Themes.Grey.withOpacity(0.1),
                              thickness: 2,
                            ),
                            Text(
                              provider.todayDeal[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                      fontWeight: Dimension.textMedium,
                                      color: Themes.White),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen()),
                                );
                              },
                              child: Container(
                                width: Get.width * 0.3,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: Dimension.Size_3,
                                    bottom: Dimension.Size_3),
                                decoration: BoxDecoration(
                                    color: Themes.Primary2,
                                    borderRadius: BorderRadius.circular(
                                        Dimension.Size_5)),
                                child: Text(
                                  language.Add_to_cart,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: Themes.White,
                                          fontWeight: Dimension.textMedium),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimension.Size_5,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: Dimension.Size_10,
                          right: Dimension.Size_10,
                          child: InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                              color: Themes.White,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget trendingShop() {
    return Container(
      height: Get.height * 0.333,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: provider.trendingShop.length,
        itemBuilder: (context, index) {
          return GridAnimation(
            index: index,
            column: provider.trendingShop.length,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopDetailsScreen()),
                );
              },
              child: Container(
                //padding: EdgeInsets.only(left: Dimension.Size_10,right: provider.trendingShop.length-1==index ? Dimension.Size_10 : 0),
                width: Get.width * 0.6,
                margin: EdgeInsets.only(
                    left: Dimension.Size_10,
                    right: provider.trendingShop.length - 1 == index
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
                      color: provider.trendingShop[index].color,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            //color: provider.trendingShop[index].color,
                            child: Image.asset(
                              provider.trendingShop[index].image,
                              height: Get.height * 0.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      provider.trendingShop[index].name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      provider.trendingShop[index].details,
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
                                '${provider.trendingShop[index].distance} ${language.Km_Away}',
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
                                '${provider.trendingShop[index].rating} (${provider.trendingShop[index].totalRating})',
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
            ),
          );
        },
      ),
    );
  }

  Widget allShop() {
    return Container(
      height: Get.height * 0.33,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: provider.allShop.length,
        itemBuilder: (context, index) {
          return GridAnimation(
            index: index,
            column: provider.trendingShop.length,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopDetailsScreen()),
                );
              },
              child: Container(
                width: Get.width * 0.75,
                margin: EdgeInsets.only(
                    left: Dimension.Size_10,
                    right: provider.allShop.length - 1 == index
                        ? Dimension.Size_10
                        : 0),
                decoration: BoxDecoration(
                  color: Themes.White,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  //boxShadow: Themes.defaultShadow,
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: provider.allShop[index].color,
                      child: Center(
                          child: Image.asset(
                        provider.allShop[index].image,
                        height: Get.height * 0.2,
                        fit: BoxFit.cover,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.allShop[index].name,
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Text(
                                  provider.allShop[index].details,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.Size_16,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${provider.allShop[index].distance} ${language.Km_Away}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.Size_16,
                                    ),
                                    SizedBox(
                                      width: Dimension.Size_5,
                                    ),
                                    Text(
                                      '${provider.allShop[index].rating} (${provider.allShop[index].totalRating})',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget recommendedItem() {
    return StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: provider.recommended.length,
      padding:
          EdgeInsets.only(left: Dimension.Size_10, right: Dimension.Size_10),
      crossAxisCount: 6,
      mainAxisSpacing: Dimension.Size_8,
      crossAxisSpacing: Dimension.Size_8,
      itemBuilder: (context, index) {
        return GridAnimation(
            column: 3,
            index: index,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                height: Get.height * 0.19,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Themes.White,
                  borderRadius: BorderRadius.circular(Dimension.Size_5),
                  //boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      provider.recommended[index].image,
                      fit: BoxFit.contain,
                      height: Get.height * 0.12,
                    ),
                    Divider(
                      height: 2,
                      color: Themes.Grey.withOpacity(0.1),
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimension.Size_5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.recommended[index].name,
                            style: Theme.of(context).textTheme.bodyText1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    );
  }
}
