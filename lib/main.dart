import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/page_cubit.dart';
import 'package:xenon_store/pages/details_chat.dart';
import 'package:xenon_store/pages/home/main_page.dart';
import 'package:xenon_store/pages/sign_in_page.dart';
import 'package:xenon_store/pages/sign_up_page.dart';
import 'package:xenon_store/pages/splash_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PageCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailsChat(),
        },
      ),
    );
  }
}
