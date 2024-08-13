import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showSuccessDialog(BuildContext context, String content) async {
  ScreenUtil.init(context);
  final FocusNode focusNode = FocusNode();

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        FocusScope.of(context).requestFocus(focusNode);

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
          content: RawKeyboardListener(
            focusNode: focusNode,
            onKey: (event) {
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.enter) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
