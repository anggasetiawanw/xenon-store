import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/wishlist_cubit.dart';
import 'package:xenon_store/models/product_model.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/custom_button.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage(this.product, {Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  int currentIndex = 0;
  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];
  @override
  Widget build(BuildContext context) {
    bool isWhislist =
        context.watch<WishlistCubit>().isWishtlist(widget.product);

    pickImage() {
      if (isWhislist) {
        return Image.asset("assets/button_love_blue.png", width: 46);
      } else {
        return Image.asset("assets/button_love.png", width: 46);
      }
    }

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: bgColor3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: pTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/image_done.png",
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Hurray",
                    style:
                        pTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Item added successfully",
                    style: subTextStyle,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                    onPressed: () {},
                    title: "View My Cart",
                    width: 154,
                    height: 44,
                    marginTop: 0,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        height: 4,
        width: currentIndex == index ? 16 : 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : dotColor,
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Container(
        decoration: BoxDecoration(color: bgColor6),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.chevron_left),
                  ),
                  Image.asset("assets/icon_cart2.png", width: 20),
                ],
              ),
            ),
            CarouselSlider(
              items: widget.product.galleries
                  .map(
                    (image) => Image.network(
                      image.url,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.galleries.map((e) {
                index++;
                return indicator(index);
              }).toList(),
            ),
            SizedBox(
              height: 17,
            ),
          ],
        ),
      );
    }

    Widget familiarImage(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
        ),
      );
    }

    Widget content() {
      int index = -1;
      return BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              color: bgColor1,
            ),
            child: Column(
              children: [
                // ? header
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: pTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold),
                            ),
                            Text(
                              widget.product.category.name,
                              style: sTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<WishlistCubit>()
                              .selectedWishlist(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  isWhislist ? alertColor : secondaryColor,
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
                      ),
                    ],
                  ),
                ),

                // ? Price
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: bgColor2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price starts from",
                        style: pTextStyle,
                      ),
                      Text(
                        "\$${widget.product.price}",
                        style: priceTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
                // ? Description
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: pTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.product.description,
                        style: sTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                // ? Familiar Shoes
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Text(
                          "Fimiliar Shoes",
                          style: pTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: familiarShoes.map((imageUrl) {
                            index++;
                            return Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? defaultMargin : 0),
                                child: familiarImage(imageUrl));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                // ? Button
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detail-chat');
                          },
                          child:
                              Image.asset("assets/button_chat.png", width: 54)),
                      SizedBox(
                        width: 16,
                      ),
                      CustomButton(
                        onPressed: () {
                          showSuccessDialog();
                        },
                        title: "Add To Cart",
                        width: 245,
                        marginTop: 0,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: ListView(children: [
        header(),
        content(),
      ]),
    );
  }
}
