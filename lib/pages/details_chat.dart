import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class DetailsChat extends StatelessWidget {
  const DetailsChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                "assets/image_logo_online.png",
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Xenon Store",
                    style:
                        pTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                  ),
                  Text(
                    "Online",
                    style: sTextStyle.copyWith(fontWeight: light, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
