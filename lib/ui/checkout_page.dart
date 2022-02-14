import 'package:flutter/material.dart';

import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/checkcout_card.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // ? LIST ITEM
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("List Items",
                    style: pTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    )),
                CheckoutCard(),
                CheckoutCard(),
                CheckoutCard(),
                CheckoutCard(),
              ],
            ),
          ),

          //? ADDRESS DETAILS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: pTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/icon_store_location.png",
                          width: 40,
                        ),
                        Image.asset(
                          "assets/line.png",
                          height: 30,
                        ),
                        Image.asset(
                          "assets/icon_location.png",
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Location",
                          style: sTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Adidas Core",
                          style: pTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Your Address",
                          style: sTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Texasmalaya",
                          style: pTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          // ? Payment Summary
          Container(
            margin: EdgeInsets.only(top: defaultMargin, bottom: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Summary",
                  style: pTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Quantity",
                      style: sTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "2 Items",
                      style: pTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Price",
                      style: sTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "\$575.96",
                      style: pTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping",
                      style: sTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "Free",
                      style: pTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                ),
                SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                    Text(
                      "\$575.96",
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget customBottonNavbar() {
      return Container(
        height: 80,
        decoration: BoxDecoration(
          color: bgColor1,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/checkout-success', (route) => false);
                },
                child: Text(
                  "Checkout Now",
                  style: pTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: customBottonNavbar(),
      appBar: AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text("Checkout Details"),
        elevation: 0,
      ),
      backgroundColor: bgColor3,
      body: content(),
    );
  }
}
