import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/ui/home/chat_page.dart';
import 'package:xenon_store/ui/home/home_page.dart';
import 'package:xenon_store/ui/home/profile_page.dart';
import 'package:xenon_store/ui/home/whislist_page.dart';
import 'package:xenon_store/theme.dart';
import 'package:xenon_store/cubit/page_cubit.dart';
import 'package:xenon_store/widget/custom_button_navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WhislistPage();
        case 3:
          return const ProfilePage();
        default:
      }
      return const HomePage();
    }

    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Image.asset(
          "assets/icon_cart.png",
          width: 20,
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: currentIndex == 0 ? bgColor1 : bgColor3,
          floatingActionButton: cartButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomButtonNavbar(
            index: currentIndex,
          ),
          body: SafeArea(
            child: buildContent(currentIndex),
          ),
        );
      },
    );
  }
}
