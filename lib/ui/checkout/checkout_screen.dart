import 'package:flutter/material.dart';
import 'components/body.dart';

class CheckoutScreen extends StatelessWidget {
  //static String routeName = "/Checkout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
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
                  'assets/images/checkout/checkout_header_image.png',
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

/*
import 'package:flutter/material.dart';
import 'components/categoryBody.dart';

class CheckoutScreen extends StatelessWidget {
  static String routeName = "/Checkout";
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Checkout_Home(),
    );
  }
}

class Checkout_Home extends StatefulWidget {
  @override
  _Checkout_HomeState createState() => _Checkout_HomeState();
}

class _Checkout_HomeState extends State<Checkout_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              title: new Text(
                "Hello World",
                style: TextStyle(color: Colors.amber),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: new Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:kolica/components/Language.dart';
import '../../BaseActivity.dart';
import 'components/categoryBody.dart';

class CheckoutScreen extends StatelessWidget {
  static String routeName = "/Checkout";
  @override
  Widget build(BuildContext context) {
    return BaseActivity(
      title: "Checkout",
      body: Body(),
    );
  }
}*/
