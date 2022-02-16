import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/wishlist_cubit.dart';
import 'package:xenon_store/models/product_model.dart';
import 'package:xenon_store/theme.dart';

class WishlistButtonPP extends StatelessWidget {
  final ProductModel product;
  const WishlistButtonPP(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWhislist = context.watch<WishlistCubit>().isWishtlist(product);

    pickImage() {
      if (isWhislist) {
        print("ADD TO WISHLIST");
        return Image.asset("assets/button_love_blue.png", width: 46);
      } else {
        print("remove from wishli");
        return Image.asset("assets/button_love.png", width: 46);
      }
    }

    return GestureDetector(
      onTap: () {
        context.read<WishlistCubit>().selectedWishlist(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            backgroundColor: isWhislist ? alertColor : secondaryColor,
            content: Text(
              isWhislist
                  ? "Item removed from wishlist"
                  : "Item added to wishlist",
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      child: pickImage(),
    );
  }
}
