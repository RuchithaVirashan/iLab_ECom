import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/default_text.dart';

class NoItemMsg extends StatelessWidget {
  const NoItemMsg({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultText(
            colorR: Colors.black,
            content: 'Cart is Empty',
            fontSizeR: 24.sp,
            fontWeightR: FontWeight.bold,
            textAlignR: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            child: DefaultText(
              colorR: const Color.fromRGBO(25, 30, 29, 1),
              content:
                  '👋 Oops! No items found in cart. Please add some items.',
              fontSizeR: 20.sp,
              fontWeightR: FontWeight.w400,
              textAlignR: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
