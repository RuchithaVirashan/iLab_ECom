import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/common/header_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: HeaderText(
              colorR: Colors.black,
              content: 'CART',
              fontSizeR: 20.sp,
              fontWeightR: FontWeight.bold,
              textAlignR: TextAlign.start,
              letterSpace: 5.sp,
            ),
          ),
        ),
        body: const Placeholder(),
      ),
    );
  }
}
