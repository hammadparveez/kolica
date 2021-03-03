import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/Packege/Loading_Button/Loading_Button.dart';
import 'package:kolica/Providers/ForgotPasswordProvider.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/Widgets/BackButton.dart';
import 'package:kolica/Widgets/DefaultTextField.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'package:provider/provider.dart';

import '../../main.dart';



class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with TickerProviderStateMixin {
  ForgotPasswordProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordProvider>(
      create: (_) => ForgotPasswordProvider(),
      child: Consumer<ForgotPasswordProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            body: WillPopScope(
              onWillPop: provider.back,
              child: mainView()
            ),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            height: Get.height*0.3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(child: Container(
                        color: Themes.Primary,
                      )),
                      Image.asset('assets/images/header.png',width: Get.width,fit: BoxFit.fitWidth,color: Themes.Primary,),
                    ],
                  ),
                ),
                Positioned(
                    top: paddingTop,
                    width: Get.width,
                    child: Column(
                      children: [
                        SizedBox(height: Dimension.Size_5,),
                        Text(language.Forgot_Password_Title[provider.pageIndex],style: Theme.of(context).textTheme.headline1.copyWith(color: Themes.White,fontSize: Dimension.Size_20,fontWeight: Dimension.textMedium),textAlign: TextAlign.center,),
                        Container(
                          margin: EdgeInsets.only(left: Dimension.Size_32,right: Dimension.Size_32,top: Dimension.Size_20,bottom: Dimension.Size_20),
                          child: Text(language.Forgot_Password_Message[provider.pageIndex],style: Theme.of(context).textTheme.bodyText1.copyWith(color: Themes.White),textAlign: TextAlign.center,),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          Positioned.fill(
            child: PageView(
              controller: provider.controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                EnterEmailView(),
                VerifyPinView(),
                EnterNewPasswordView()
              ],
              onPageChanged: provider.onPageChange,
            ),
          ),
          Positioned(
            bottom: Dimension.Size_20,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingButton(
                  isLoading: false,
                  onPressed: (){
                    provider.changePage();
                  },
                  child: Container(
                      width: Get.width-(Dimension.Padding*6),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(Dimension.Size_20).copyWith(top: 0,bottom: 0),
                      child: Text(language.Forgot_Password_Button[provider.pageIndex],style: Theme.of(context).textTheme.bodyText1.copyWith(color: Themes.White,fontSize: Dimension.Size_20),)
                  ),
                ),
              ],
            ),
          ),
          DefaultBackButton(context,onTap: provider.back)
        ],
      ),
    );
  }

  Widget EnterEmailView(){
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Card(
          margin: EdgeInsets.only(top: (Get.height*0.2),left: Dimension.Padding,right: Dimension.Padding,bottom: Dimension.Size_20),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height*0.15,
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimension.Padding),
            child: DefaultTextField(
              controller: provider.email,
              label: language.Email
            ),
          ),
        ),
      ],
    );
  }

  Widget EnterNewPasswordView(){
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Card(
          margin: EdgeInsets.only(top: (Get.height*0.2),left: Dimension.Padding,right: Dimension.Padding,bottom: Dimension.Size_20),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimension.Padding),
            child: Column(
              children: [
                DefaultTextField(
                    controller: provider.newPass,
                    label: language.New_password
                ),
                DefaultTextField(
                    controller: provider.newConPass,
                    label: language.Confirm_New_password
                ),
                SizedBox(height: Dimension.Size_10,)
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget VerifyPinView() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Card(
          margin: EdgeInsets.only(top: (Get.height*0.2),left: Dimension.Padding,right: Dimension.Padding,bottom: Dimension.Size_10),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height*0.15,
            alignment: Alignment.center,
            child: Container(
              height: Get.height*0.05,
              margin: EdgeInsets.only(
                left: Dimension.Padding,right: Dimension.Padding
              ),
              child: PinPut(
                fieldsCount: 4,
                onSubmit: (String pin) {

                },
                //focusNode: _pinPutFocusNode,
                //controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration.copyWith(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Themes.Primary.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: Themes.Primary),
      ),
    );
  }


}
