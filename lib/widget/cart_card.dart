import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenon_store/cubit/cart_cubit.dart';
import 'package:xenon_store/models/cart_model.dart';
import 'package:xenon_store/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  const CartCard(this.cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      cart.product.galleries[0].url,
                    ),
                    fit: BoxFit.cover,
                  ),
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
                      style: pTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
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
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addQuantity(cart.id);
                    },
                    child: Image.asset(
                      "assets/button_add.png",
                      width: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: pTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      "assets/button_min.png",
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              context.read<CartCubit>().removeItem(cart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/icon_trash.png",
                  width: 10,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "Remove",
                  style: GoogleFonts.poppins(color: alertColor).copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
