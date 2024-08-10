import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'screen/main/main_screen.dart';
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ecom',
            theme: AppTheme.lightTheme,
            // home: const MainScreen(
            //   selectedIndex: 0,
            // ),
            home: Container(
              color: Colors.green,
            ),
          );
        });
  }
}
