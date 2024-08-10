import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color bcolor;
  final Color fcolor;
  final Color tcolor;
  final double radius;
  final double minHeight;
  final Color borderColor;
  final void Function()? onPressed;

  const ButtonWidget({
    Key? key,
    required this.buttonName,
    required this.bcolor,
    required this.tcolor,
    required this.radius,
    required this.fcolor,
    required this.minHeight,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: fcolor,
        backgroundColor: bcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          side: BorderSide(color: borderColor),
        ),
        minimumSize: Size(double.infinity, minHeight),
        padding: EdgeInsets.all(8.r),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: TextStyle(
          color: tcolor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
