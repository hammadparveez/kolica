import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolica/app_components/constants.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter_svg/svg.dart';

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            SizedBox(height: 45),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                //height: 100.0,
                margin: const EdgeInsets.only(
                    bottom: 6.0), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: TextField(
                          style: Theme.of(context).textTheme.headline5,
                          cursorColor: Colors.black,
                          inputFormatters: [],
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: kBackgroundColor,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 25,
                                color: kSubTextColor,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 14.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              border: InputBorder.none,
                              hintText: "Search anything...",
                              hintStyle: Theme.of(context).textTheme.subtitle1),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: ShapeOfView(
                            height: 50,
                            width: 50,
                            elevation: 0,
                            shape: RoundRectShape(
                              borderRadius: BorderRadius.circular(5),
                              borderColor: Colors.black, //optional
                              borderWidth: 0, //optional
                            ),
                            child: Container(
                              color: kSearchCLear_iconBG,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.clear,
                                  size: 25,
                                  color: kSearchCLear_icon,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            // clear function
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search History',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  InkWell(
                    child: Text(
                      "Clear All",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: kClearAll,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //assets/icons/history.svg
                  SvgPicture.asset('assets/icons/history.svg'),
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    child: Text(
                      "microfiber Hand Duster",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //assets/icons/history.svg
                  SvgPicture.asset('assets/icons/history.svg'),
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    child: Text(
                      "fresh cabbage",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //assets/icons/history.svg
                  SvgPicture.asset('assets/icons/history.svg'),
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    child: Text(
                      "green apple",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //assets/icons/history.svg
                  SvgPicture.asset('assets/icons/history.svg'),
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    child: Text(
                      "hand sanitizers",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
