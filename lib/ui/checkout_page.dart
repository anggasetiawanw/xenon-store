import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/cart_cubit.dart';
import 'package:xenon_store/cubit/transaction_cubit.dart';
import 'package:xenon_store/models/cart_model.dart';
import 'package:xenon_store/models/user_model.dart';

import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/checkcout_card.dart';

class CheckoutPage extends StatelessWidget {
  final UserModel user;
  const CheckoutPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartModel> carts = [];
    int items = context.watch<CartCubit>().totalItems();
    int totalPrice = context.watch<CartCubit>().totalPrice();
    Widget content() {
      return BlocBuilder<CartCubit, CartState>(
        builder: (context, states) {
          if (states is CartSuccess) {
            carts = states.carts;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                // ? LIST ITEM
                Container(
                  margin: const EdgeInsets.only(top: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("List Items",
                          style: pTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          )),
                      Column(
                        children: states.carts.map((CartModel cart) {
                          return CheckoutCard(cart);
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                //? ADDRESS DETAILS
                Container(
                  margin: const EdgeInsets.only(top: defaultMargin),
                  padding: const EdgeInsets.all(20),
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
                      const SizedBox(height: 12),
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
                          const SizedBox(width: 12),
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
                              const SizedBox(
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
                  margin: const EdgeInsets.only(top: defaultMargin, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: bgColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Summary",
                        style: pTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                      const SizedBox(
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
                            "$items Items",
                            style: pTextStyle.copyWith(fontWeight: medium),
                          )
                        ],
                      ),
                      const SizedBox(
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
                            "\$$totalPrice",
                            style: pTextStyle.copyWith(fontWeight: medium),
                          )
                        ],
                      ),
                      const SizedBox(
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
                      const SizedBox(
                        height: 11,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.2,
                      ),
                      const SizedBox(
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
                            "\$$totalPrice",
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
          return const SizedBox();
        },
      );
    }

    Widget customBottonNavbar() {
      return Container(
        height: 80,
        decoration: const BoxDecoration(
          color: bgColor1,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<TransactionCubit, TransactionState>(
              listener: (context, state) {
                if (state is TransactionSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/checkout-success', (route) => false);
                } else if (state is TransactionFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: alertColor,
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is TransactionLoading) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    child: const CircularProgressIndicator(),
                  );
                }
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<TransactionCubit>()
                          .checkout(user.token.toString(), carts, totalPrice);
                      context.read<CartCubit>().removeAllCart();
                    },
                    child: Text(
                      "Checkout Now",
                      style: pTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
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
        title: const Text("Checkout Details"),
        elevation: 0,
      ),
      backgroundColor: bgColor3,
      body: content(),
    );
  }
}
