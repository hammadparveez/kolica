import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:kolica/app_components/constants.dart';
class CartSummaryScreen extends StatelessWidget {
  //static String routeName = "/Cart Summery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text("Cart Summery"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
              AssetImage("assets/images/checkout/checkout_header_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(190),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/checkout/cart_summary_header_image.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      body: Body(),
    );
  }
}



