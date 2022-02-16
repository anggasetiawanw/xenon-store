import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/custom_button.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image_cart.png",
              width: 80,
            ),
           const  SizedBox(
              height: 20,
            ),
            Text(
              "You made a transaction",
              style: pTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Stay at home while we\nprepare your dream shoes",
              textAlign: TextAlign.center,
              style: sTextStyle,
            ),
           const  SizedBox(
              height: 12,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              title: "Order Other Shoes",
              height: 44,
              width: 152,
              marginTop: 0,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
              onPressed: () {},
              title: "View My Order",
              height: 44,
              width: 152,
              marginTop: 0,
              changeColor: true,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Checkout Success",
          style: pTextStyle.copyWith(fontWeight: medium, fontSize: 16),
        ),
      ),
      body: content(),
    );
  }
}
