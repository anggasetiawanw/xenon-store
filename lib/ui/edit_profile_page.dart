import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/auth_cubit.dart';
import 'package:xenon_store/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget nameInput(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: sTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: text,
                hintStyle: pTextStyle,
                enabledBorder:const  UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget usernameInput(String text) {
      return Container(
        margin:const  EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: sTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: text,
                hintStyle: pTextStyle,
                enabledBorder:const  UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput(String text) {
      return Container(
        margin:const  EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: sTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: text,
                hintStyle: pTextStyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(top: defaultMargin),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                NetworkImage("${state.user.profilePhotoUrl}"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    nameInput("${state.user.name}"),
                    usernameInput("${state.user.username}"),
                    emailInput("${state.user.email}"),
                  ],
                ));
          } else {
            return const SizedBox();
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: AppBar(
            centerTitle: true,
            title: const Text("Edit Profile"),
            backgroundColor: bgColor1,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: pTextColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check,
                    color: primaryColor,
                  ))
            ],
          ),
        ),
      ),
      body: content(),
    );
  }
}
