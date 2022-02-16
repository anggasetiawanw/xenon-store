import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/chat_tile.dart';
import 'package:xenon_store/widget/custom_button.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: bgColor1,
        title: Text(
          "Message Support",
          style: pTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat(){
      return Expanded(
          child: Container(
        color: bgColor3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image_headset.png",
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Opss no message yet?",
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

    Widget content() {
      return Expanded(
          child: Container(
        color: bgColor3,
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          children: const [
             ChatTile()
          ],
        )
      ));
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
