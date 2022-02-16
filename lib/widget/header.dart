import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class Header extends StatelessWidget {
  final String title;
  final String subTitle;
  const Header({Key? key,
  required this.title,
  required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: pTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            subTitle,
            style: subTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          ),
        ],
      ),
    );
  }
}
