import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/detail-chat");
      },
      child: Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/image_logo.png",
                  width: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Xenon Store",
                        style: pTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        "Good night, This item is on...",
                        style: sTextStyle.copyWith(fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Now",
                  style: sTextStyle.copyWith(
                    fontSize: 10,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Divider(
              thickness: 1,
              color: Color(0xff2b2939),
            )
          ],
        ),
      ),
    );
  }
}
