import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/auth_cubit.dart';
import 'package:xenon_store/cubit/product_cubit.dart';
import 'package:xenon_store/models/product_model.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/popular_product_card.dart';
import 'package:xenon_store/widget/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, states) {
          if (states is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, ${states.user.name}",
                          style: pTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "@${states.user.username}",
                          style: subTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("${states.user.profilePhotoUrl}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget categories() {
      return Container(
        margin: const EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: defaultMargin,
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  "All Shoes",
                  style: pTextStyle.copyWith(fontWeight: medium, fontSize: 13),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  "Running",
                  style: subTextStyle.copyWith(fontWeight: light, fontSize: 13),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  "Training",
                  style: subTextStyle.copyWith(fontWeight: light, fontSize: 13),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  "BasketBall",
                  style: subTextStyle.copyWith(fontWeight: light, fontSize: 13),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  "Hiking",
                  style: subTextStyle.copyWith(fontWeight: light, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProdutcsTitle() {
      return Container(
        margin: const EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          "Popular Products",
          style: pTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget popularProducts(List<ProductModel> products) {
      return Container(
        margin: const EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: products.map((ProductModel products) {
                  return PopularProductCards(products);
                }).toList(),
              )
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: const EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          "New Arrivals",
          style: pTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget newArrivals(List<ProductModel> products) {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Column(
          children: products.map((ProductModel products) {
            return ProductTile(products);
          }).toList(),
        ),
      );
    }

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child:  CircularProgressIndicator(),
          );
        } else if (state is ProductSuccess) {
          return ListView(
            children: [
              header(),
              categories(),
              popularProdutcsTitle(),
              popularProducts(state.products),
              newArrivalsTitle(),
              newArrivals(state.products),
            ],
          );
        } else if (state is ProductFailed) {
          return Center(
            child: Text(
              state.message,
              style: pTextStyle,
            ),
          );
        }
        return Center(
          child: Text(
            'Failed Get Product',
            style: pTextStyle,
          ),
        );
      },
    );
  }
}
