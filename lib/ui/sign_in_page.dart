import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/auth_cubit.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/widget/custom_button.dart';
import 'package:xenon_store/widget/custom_text_field.dart';
import 'package:xenon_store/widget/footer.dart';
import 'package:xenon_store/widget/header.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
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
                  'Sign In success',
                  style: pTextStyle,
                  textAlign: TextAlign.center,
                ),
                duration: const Duration(seconds: 1),
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
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }
          return CustomButton(
              onPressed: () {
                context.read<AuthCubit>().login(
                    email: emailController.text,
                    password: passwordController.text);
              },
              title: "Sign In");
        },
      );
    }

    return Scaffold(
        backgroundColor: bgColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(title: "Login", subTitle: "Sign In to Continue"),
                CustomTextField(
                  title: "Email Address",
                  imageUrl: "assets/icon_email.png",
                  top: 70,
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
                const Spacer(),
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
