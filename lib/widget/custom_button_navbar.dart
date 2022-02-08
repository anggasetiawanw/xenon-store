import 'package:flutter/material.dart';
import 'package:xenon_store/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/page_cubit.dart';

class CustomButtonNavbar extends StatelessWidget {
  final int index;
  const CustomButtonNavbar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 16,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            backgroundColor: bgColor4,
            currentIndex: context.read<PageCubit>().state,
            onTap: (value) {
              context.read<PageCubit>().setPage(value);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    "assets/icon_home.png",
                    width: 21,
                    color: context.read<PageCubit>().state == 0
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    "assets/icon_chat.png",
                    width: 20,
                    color: context.read<PageCubit>().state == 1
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    "assets/icon_love.png",
                    width: 20,
                    color: context.read<PageCubit>().state == 2
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    "assets/icon_profile.png",
                    width: 18,
                    color: context.read<PageCubit>().state == 3
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
            ]),
      ),
    );
  }
}
