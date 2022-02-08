import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/custom_button.dart';
import 'package:xenon_store/widget/custom_text_field.dart';
import 'package:xenon_store/widget/footer.dart';
import 'package:xenon_store/widget/header.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
                Header(title: "Login", subTitle: "Sign In to Continue"),
                CustomTextField(
                  title: "Email Address",
                  imageUrl: "assets/icon_email.png",
                  top: 70,
                ),
                CustomTextField(
                  title: "Your Password",
                  imageUrl: "assets/icon_password.png",
                  obscureText: true,
                ),
                CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    title: "Sign In"),
                Spacer(),
                Footer(
                    title: "Don't have an account? ",
                    buttonTitle: "Sign Up",
                    onPressed: () {
                      Navigator.pushNamed(context, "/sign-up");
                    })
              ],
            ),
          ),
        ));
  }
}
