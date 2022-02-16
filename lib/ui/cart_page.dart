import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/auth_cubit.dart';
import 'package:xenon_store/cubit/cart_cubit.dart';
import 'package:xenon_store/models/cart_model.dart';
import 'package:xenon_store/models/user_model.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/ui/checkout_page.dart';
import 'package:xenon_store/widget/cart_card.dart';
import 'package:xenon_store/widget/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int harga = context.watch<CartCubit>().totalPrice();
    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image_cart.png",
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Opss! Your Cart is Empty",
              style: pTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Let's find your favorite shoes",
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
              marginTop: 0,
            ),
          ],
        ),
      );
    }

    Widget content(List<CartModel> cart) {
      return ListView(
        padding:const  EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: cart.map((CartModel cart) {
          return CartCard(cart);
        }).toList(),
      );
    }

    Widget customBottomNavbar() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthSuccess) {
          // ignore: sized_box_for_whitespace
          return Container(
            height: 180,
            child: Column(
              children: [
                Container(
                  padding:const  EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: pTextStyle,
                      ),
                      Text(
                        "\$${harga.toString()}",
                        style: priceTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const  EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding:const  EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CheckoutPage(UserModel(
                          token: state.user.token,
                        ));
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Continue to Checkout",
                          style: pTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: pTextColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      });
    }

    return Scaffold(
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            if (state.carts.isEmpty) {
              return const SizedBox();
            }
            return customBottomNavbar();
          }
          return const  SizedBox();
        },
      ),
      backgroundColor: bgColor3,
      appBar: AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: const  Text("Your Cart"),
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            if (state.carts.isEmpty) {
              return emptyCart();
            }
            return content(state.carts);
          }
          return emptyCart();
        },
      ),
    );
  }
}
