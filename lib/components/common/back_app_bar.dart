import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'header_text.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String statename;
  const BackAppBar({super.key, required this.statename});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 1,
            offset: Offset(0, 0.50),
            spreadRadius: 0,
          )
        ],
      ),
      child: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        leading: Container(),
        elevation: 0,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.navigate_before,
                    color: const Color(0xFF363062),
                    size: 40.sp,
                  ),
                  splashRadius: 20.r,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 10.w),
                HeaderText(
                  colorR: Colors.black,
                  content: statename,
                  fontSizeR: 20.sp,
                  fontWeightR: FontWeight.bold,
                  textAlignR: TextAlign.start,
                  letterSpace: 5.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
