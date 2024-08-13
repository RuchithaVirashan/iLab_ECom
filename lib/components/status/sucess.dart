import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showSuccessDialog(BuildContext context, String content) async {
  ScreenUtil.init(context);

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'SUCESS',
            style: TextStyle(letterSpacing: 8),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 18,
            color: Color(0xFF157821),
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            fontSize: 24,
            color: Color(0xFF157821),
            fontWeight: FontWeight.w400,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Okay',
                  style: TextStyle(color: Color(0xFF157821))),
            ),
          ],
        );
      },
    );
  });
}
