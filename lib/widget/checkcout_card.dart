import 'package:flutter/material.dart';
import 'package:xenon_store/models/cart_model.dart';
import 'package:xenon_store/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  const CheckoutCard(this.cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              cart.product.galleries[0].url,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: pTextStyle.copyWith(fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "\$${cart.product.price}",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Text("${cart.quantity} Items",
              style: sTextStyle.copyWith(
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}
