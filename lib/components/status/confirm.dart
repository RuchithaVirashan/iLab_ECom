import 'package:flutter/material.dart';

Future<void> showConfirmDialog(BuildContext context, String content,
    void Function() confimation, String header) async {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          header.toUpperCase(),
          style: const TextStyle(letterSpacing: 8),
        ),
        content: Text(content),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xFF154478),
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(
          fontSize: 24,
          color: Color(0xFF154478),
          fontWeight: FontWeight.w400,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              confimation();
              Navigator.of(context).pop();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  });
}
