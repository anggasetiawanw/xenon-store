import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class Footer extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() onPressed;
  const Footer({ Key? key,required this.title, required this.buttonTitle,required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: subTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                buttonTitle,
                style:
                    orangeTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            ),
          ],
        ),
      );
  }
}