import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolica/app_components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:kolica/app_components/AppConstant.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/ui/notification/notification_screen.dart';
import 'package:kolica/ui/profile/components/list.dart' as list_data;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/profile/profile_header_bg.png"),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(190),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage('assets/images/profile/profile.png'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Maria Hernandez',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConstant.font_mukta),
              ),
              Text(
                'mariahernandez67@gmail.com',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConstant.font_mukta),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
      //body: Body(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: list_data.getListView(),
      ),

      /*Stack(
        children: [
          Positioned(
            child: PageView(
              //physics: NeverScrollableScrollPhysics(),
              children: [
                //SignUpView(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: list_data.getListView(),
                ),
              ],
            ),
          ),
        ],
      ),*/
    );
  }
}
