import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double height;
  final double width;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.height = 50,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      height: height,
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            title,
            style: pTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          )),
    );
  }
}
