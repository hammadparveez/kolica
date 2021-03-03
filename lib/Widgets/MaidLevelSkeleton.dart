import 'package:kolica/app_components/Dimension.dart';
import 'package:kolica/app_components/ThemesColor.dart';
import 'package:kolica/Widgets/GridAnimation.dart';
import 'package:kolica/Widgets/ListAnimation.dart';
import 'package:kolica/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kolica/main.dart';

Widget MaidLevelSkeleton({@required BuildContext context, int count = 5}) {
  return ListView.builder(
    itemCount: count,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.zero,
    itemBuilder: (context, index) {
      return GridAnimation(
          column: count,
          index: index,
          child: SkeletonBuilder(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.2,
                height: Get.width * 0.20,
                margin: EdgeInsets.only(right: Dimension.Size_10),
                decoration: BoxDecoration(
                    color: Themes.White,
                    borderRadius: BorderRadius.circular(Dimension.Size_5)),
              ),
              Container(
                width: Get.width * 0.20,
                height: Get.width * 0.035,
                margin: EdgeInsets.only(right: Dimension.Size_10),
                decoration: BoxDecoration(
                    color: Themes.White,
                    borderRadius: BorderRadius.circular(Dimension.Size_20)),
              ),
            ],
          )));
    },
  );
}
