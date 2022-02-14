import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/auth_cubit.dart';
import 'package:xenon_store/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return AppBar(
              backgroundColor: bgColor1,
              automaticallyImplyLeading: false,
              elevation: 0,
              flexibleSpace: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(defaultMargin),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          "${state.user.profilePhotoUrl}",
                          width: 64,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, ${state.user.name}",
                              style: pTextStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold),
                            ),
                            Text(
                              "@${state.user.username}",
                              style: subTextStyle.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/sign-in', (route) => false);
                        },
                        child: Image.asset(
                          "assets/icon_exit.png",
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: sTextStyle,
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.chevron_right,
              color: pTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(color: bgColor3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Account",
                style: pTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  "Edit Profile",
                ),
              ),
              menuItem(
                "Your Orders",
              ),
              menuItem(
                "Help",
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "General",
                style: pTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              menuItem(
                "Privacy & Policy",
              ),
              menuItem(
                "Term of Service",
              ),
              menuItem(
                "Rate App",
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
