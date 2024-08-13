import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilabecom/screen/checkout_screen.dart';
import 'dart:ui' as ui;

import 'bloc/cart/cart_bloc.dart';
import 'bloc/product_list/product_list_bloc.dart';
import 'bloc/user_data/user_data_bloc.dart';
import 'screen/item_details_screen.dart';
import 'screen/main_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const ui.Size(414, 896),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ProductListBloc()),
              BlocProvider(create: (_) => CartBloc()),
              BlocProvider(create: (_) => UserDataBloc()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ecom',
              theme: AppTheme.lightTheme,
              routes: {
                '/details': (context) => const ItemDetailsSceen(),
                '/checkout': (context) => const CheckoutScreen(),
              },
              home: const MainScreen(
                selectedIndex: 0,
              ),
            ),
          );
        });
  }
}
