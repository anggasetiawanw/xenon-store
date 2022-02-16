import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/wishlist_cubit.dart';
import 'package:xenon_store/models/product_model.dart';
import 'package:xenon_store/theme.dart';

class WhislistCard extends StatelessWidget {
  final ProductModel product;
  const WhislistCard(this.product, {Key? key}) : super(key: key);

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
              product.galleries[0].url,
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
                  product.name,
                  style: pTextStyle.copyWith(fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "\$${product.price}",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<WishlistCubit>().selectedWishlist(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: secondaryColor,
                  content: Text(
                    "Item removed from wishlist",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            child: Image.asset(
              "assets/button_whitelist.png",
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
