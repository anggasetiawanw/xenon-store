import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/auth_cubit.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/custom_button.dart';
import 'package:xenon_store/widget/custom_text_field.dart';
import 'package:xenon_store/widget/footer.dart';
import 'package:xenon_store/widget/header.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Sign up success',
                  style: pTextStyle,
                  textAlign: TextAlign.center,
                ),
                duration: Duration(seconds: 1),
                backgroundColor: primaryColor,
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: pTextStyle,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: alertColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
              onPressed: () {
                context.read<AuthCubit>().register(
                    name: nameController.text,
                    username: usernameController.text,
                    email: emailController.text,
                    password: passwordController.text);
              },
              title: "Sign Up");
        },
      );
    }

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
                  controller: nameController,
                  hintText: "Your Name",
                ),
                CustomTextField(
                  title: "Username",
                  imageUrl: "assets/icon_username.png",
                  controller: usernameController,
                  hintText: "Your Username",
                ),
                CustomTextField(
                  title: "Email Address",
                  imageUrl: "assets/icon_email.png",
                  controller: emailController,
                  hintText: "Your Email Address",
                ),
                CustomTextField(
                  title: "Your Password",
                  imageUrl: "assets/icon_password.png",
                  obscureText: true,
                  controller: passwordController,
                  hintText: "Your Password",
                ),
                submitButton(),
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
