import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/image_shoes.png",
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terrex Urban Low",
                  style: pTextStyle.copyWith(fontWeight: semiBold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$143,98",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Text("2 Items",style: sTextStyle.copyWith(fontSize:12,)),
        ],
      ),
    );
  }
}