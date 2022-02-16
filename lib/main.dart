import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenon_store/cubit/auth_cubit.dart';
import 'package:xenon_store/cubit/cart_cubit.dart';
import 'package:xenon_store/cubit/page_cubit.dart';
import 'package:xenon_store/cubit/product_cubit.dart';
import 'package:xenon_store/cubit/transaction_cubit.dart';
import 'package:xenon_store/cubit/wishlist_cubit.dart';
import 'package:xenon_store/ui/cart_page.dart';
import 'package:xenon_store/ui/checkou_success_page.dart';
import 'package:xenon_store/ui/details_chat.dart';
import 'package:xenon_store/ui/edit_profile_page.dart';
import 'package:xenon_store/ui/home/main_page.dart';
import 'package:xenon_store/ui/sign_in_page.dart';
import 'package:xenon_store/ui/sign_up_page.dart';
import 'package:xenon_store/ui/splash_page.dart';

import 'ui/details_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        BlocProvider(
          create: (context) => WishlistCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(create: (context) => TransactionCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailsChat(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
