import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double top;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.title,
      required this.imageUrl,
      this.top =20,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: pTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
                color: bgColor2, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Image.asset(
                  imageUrl,
                  width: 17,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: TextFormField(
                      controller: controller,
                      obscureText: obscureText,
                  style: pTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: hintText, hintStyle: subTextStyle),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
