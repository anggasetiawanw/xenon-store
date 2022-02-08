import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: defaultMargin,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/image_shoes.png",
              fit: BoxFit.cover,
              width: 120,
              height: 120,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Footbal",
                style: sTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Predator 20.3 Firm Ground",
                style: pTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "\$68,47",
                style: priceTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
