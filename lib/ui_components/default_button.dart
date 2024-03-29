import 'package:flutter/material.dart';
import '../app_components/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //height: getProportionateScreenHeight(56),
      height: 56,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: kPrimaryColor2,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            //fontSize: getProportionateScreenWidth(18),
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
