import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenon_store/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double height;
  final double width;
  final double marginTop;
  final bool changeColor;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height = 50,
    this.width = double.infinity,
    this.marginTop = 30,
    this.changeColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      height: height,
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: changeColor ? const Color(0xff39374B) : primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            title,
            style: changeColor
                ? GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: medium,
                    color: const Color(0xffB7B6BF),
                  )
                : pTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          )),
    );
  }
}
