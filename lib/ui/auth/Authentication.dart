import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/Packege/Loading_Button/Loading_Button.dart';
import 'package:kolica/Providers/AuthenticationProvider.dart';
import 'package:kolica/Route/Route.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/Widgets/BackButton.dart';
import 'package:kolica/Widgets/DefaultTextField.dart';

import 'package:provider/provider.dart';

import '../../main.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication>
    with TickerProviderStateMixin {
  AuthenticationProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationProvider>(
      create: (_) => AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            body: WillPopScope(onWillPop: provider.back, child: mainView()),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.3,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          color: Themes.Primary,
                        )),
                        Image.asset(
                          'assets/images/header.png',
                          width: Get.width,
                          fit: BoxFit.fitWidth,
                          color: Themes.Primary,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: paddingTop,
                      width: Get.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimension.Size_5,
                          ),
                          Text(
                            provider.pageIndex == 0
                                ? language.SignIn_your_account
                                : language.Create_your_account,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: Themes.White,
                                    fontSize: Dimension.Size_20,
                                    fontWeight: Dimension.textMedium),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Dimension.Size_32,
                                right: Dimension.Size_32,
                                top: Dimension.Size_20,
                                bottom: Dimension.Size_20),
                            child: Text(
                              language.Enter_Phone_number_message,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Themes.White),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Positioned.fill(
              child: PageView(
                controller: provider.controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SignInView(),
                  SignUpView(),
                ],
                onPageChanged: provider.onPageChange,
              ),
            ),
            Positioned(
              bottom: Dimension.Size_20,
              width: Get.width,
              child: bottomView(),
            ),
            DefaultBackButton(context, onTap: provider.back)
          ],
        ),
      ),
    );
  }

  Widget SignUpView() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Card(
          margin: EdgeInsets.only(
              top: (Get.height * 0.2),
              left: Dimension.Padding,
              right: Dimension.Padding,
              bottom: Dimension.Size_20),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(Dimension.Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultTextField(
                    controller: provider.name, label: language.Name),
                DefaultTextField(
                    controller: provider.email, label: language.Email),
                DefaultTextField(
                    controller: provider.password, label: language.Password),
                DefaultTextField(
                    controller: provider.conPassword,
                    label: language.Confirm_Password),
                SizedBox(
                  height: Dimension.Size_10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget SignInView() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Card(
          margin: EdgeInsets.only(
              top: (Get.height * 0.2),
              left: Dimension.Padding,
              right: Dimension.Padding,
              bottom: Dimension.Size_10),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(Dimension.Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultTextField(
                    controller: provider.email, label: language.Email),
                DefaultTextField(
                    controller: provider.password, label: language.Password),
                SizedBox(
                  height: Dimension.Size_10,
                )
              ],
            ),
          ),
        ),
        FlatButton(
            onPressed: () {
              Get.toNamed(FORGOT_PASSWORD);
            },
            child: Text(
              language.Forgot_Password,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Themes.Grey),
            ))
      ],
    );
  }

  Widget bottomView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingButton(
              isLoading: false,
              onPressed: () {
                Get.toNamed(MAIN_PAGE);
              },
              child: Container(
                  width: Get.width - (Dimension.Padding * 6),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(Dimension.Size_20)
                      .copyWith(top: 0, bottom: 0),
                  child: Text(
                    provider.pageIndex == 0 ? language.SignIn : language.SignUp,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Themes.White, fontSize: Dimension.Size_20),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: Dimension.Size_10,
        ),
        RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                text:
                    '${provider.pageIndex == 0 ? language.Already_have_and_account : language.Dont_have_an_account} ',
                children: <TextSpan>[
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      provider.changePage();
                    },
                  text: provider.pageIndex == 0
                      ? language.SignUp
                      : language.SignIn,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: Dimension.textBold,
                      decoration: TextDecoration.underline))
            ])),
        Container(
          margin: EdgeInsets.only(
              left: Dimension.Padding,
              right: Dimension.Padding,
              top: Dimension.Size_10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                height: 1,
                color: Themes.Text_Color,
              )),
              SizedBox(
                width: Dimension.Padding,
              ),
              Text(language.or),
              SizedBox(
                width: Dimension.Padding,
              ),
              Expanded(
                  child: Container(
                height: 1,
                color: Themes.Text_Color,
              )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: Dimension.Padding,
              left: Get.width * 0.2,
              right: Get.width * 0.2,
              bottom: Get.width * 0.1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: provider.socialIcons
                .map((e) => SvgPicture.asset(
                      e,
                      height: Dimension.Size_50,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
