import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/wishlist_cubit.dart';
import 'package:xenon_store/models/product_model.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/custom_button.dart';
import 'package:xenon_store/widget/whislist_card.dart';

class WhislistPage extends StatelessWidget {
  const WhislistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: bgColor1,
        title: Text(
          "Favorite Shoes",
          style: pTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWhislist() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: bgColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image_whislist.png",
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You don't have dream shoes?",
              style: pTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "You have never done a transaction?",
              style: sTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
              onPressed: () {},
              title: "Explore Store",
              height: 44,
              width: 152,
            ),
          ],
        ),
      ));
    }

    Widget content(List<ProductModel> products) {
      return Expanded(
        child: Container(
          color: bgColor3,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            children: products.map((ProductModel products) {
              return WhislistCard(products);
            }).toList(),
          ),
        ),
      );
    }

    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (state is WishlistSuccess) {
          print(state.wishlist.length);
          return Column(
            children: [
              header(),
              state.wishlist.isEmpty
                  ? emptyWhislist()
                  : content(state.wishlist),
            ],
          );
        } else if (state is WishlistFailed) {
          return Column(
            children: [
              header(),
              emptyWhislist(),
            ],
          );
        }
        return Column(
          children: [
            header(),
            emptyWhislist(),
          ],
        );
      },
    );
  }
}
