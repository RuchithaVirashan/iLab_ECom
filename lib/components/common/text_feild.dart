import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validate;
  final TextInputType? keybordType;
  final int? maxLine;
  final void Function(dynamic value)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validate,
    this.keybordType,
    this.maxLine,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x23154378),
            blurRadius: 50.r,
            offset: const Offset(12, 24),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0x6022242E)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          contentPadding: EdgeInsets.only(
            left: 25.w,
            top: 15.h,
            bottom: 15.h,
          ),
          fillColor: const Color(0xFFFFFFFF),
          filled: true,
        ),
        validator: validate,
        keyboardType: keybordType,
        maxLines: maxLine,
        onChanged: onChanged,
      ),
    );
  }
}
