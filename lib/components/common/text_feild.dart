import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validate;
  final bool? autofocus;
  final bool? isReadOnly;
  final TextInputType? keyBoardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validate,
    this.autofocus,
    this.isReadOnly,
    this.keyBoardType,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      autofocus: autofocus ?? false,
      readOnly: isReadOnly ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0x6022242E)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        contentPadding: EdgeInsets.only(
          left: 10.w,
          top: 15.h,
          bottom: 15.h,
        ),
        fillColor: const Color(0xFFFFFFFF),
        filled: true,
      ),
      validator: validate,
      keyboardType: keyBoardType,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      onTap: onTap,
    );
  }
}
