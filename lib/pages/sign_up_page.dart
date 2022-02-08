import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/custom_button.dart';
import 'package:xenon_store/widget/custom_text_field.dart';
import 'package:xenon_store/widget/footer.dart';
import 'package:xenon_store/widget/header.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                    title: "Sign Up", subTitle: "Register and Happy Shoping"),
                CustomTextField(
                  title: "Full Name",
                  imageUrl: "assets/icon_name.png",
                  top: 70,
                ),
                CustomTextField(
                  title: "Username",
                  imageUrl: "assets/icon_username.png",
                ),
                CustomTextField(
                  title: "Email Address",
                  imageUrl: "assets/icon_email.png",
                ),
                CustomTextField(
                  title: "Your Password",
                  imageUrl: "assets/icon_password.png",
                  obscureText: true,
                ),
                CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                      ;
                    },
                    title: "Sign Up"),
                Spacer(),
                Footer(
                    title: "Already have an account? ",
                    buttonTitle: "Sign in",
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ));
  }
}
