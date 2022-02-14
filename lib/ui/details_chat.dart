import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/chat_bubble.dart';

class DetailsChat extends StatelessWidget {
  const DetailsChat({Key? key}) : super(key: key);
  @override
  Widget productPreview() {
    return Container(
      width: 225,
      height: 74,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("assets/image_shoes.png"),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "COURT VISIO...",
                  style: pTextStyle.copyWith(overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$57,15",
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/icon_close.png",
            width: 22,
          )
        ],
      ),
    );
  }

  Widget chatInput() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productPreview(),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: bgColor4,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: "Type Message...",
                      hintStyle: subTextStyle,
                    ),
                  ),
                ),
              )),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/icon_send.png",
                width: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget content() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        ChatBubble(
          text: 'Hi, This item is still available?',
          isSender: true,
          hasProduct: true,
        ),
        ChatBubble(
          text: 'Good night, This item is only available in size 42 and 43',
          isSender: false,
        ),
      ],
    );
  }
  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                "assets/image_logo_online.png",
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Xenon Store",
                    style:
                        pTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                  ),
                  Text(
                    "Online",
                    style: sTextStyle.copyWith(fontWeight: light, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
