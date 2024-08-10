import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String content;
  final double fontSizeR;
  final Color colorR;
  final TextAlign textAlignR;
  final FontWeight fontWeightR;
  final double letterSpace;

  // ignore: use_super_parameters
  const HeaderText({
    Key? key,
    required this.content,
    required this.fontSizeR,
    required this.colorR,
    required this.textAlignR,
    required this.fontWeightR,
    required this.letterSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: fontSizeR,
        fontWeight: fontWeightR,
        color: colorR,
        letterSpacing: letterSpace,
      ),
      textAlign: textAlignR,
    );
  }
}
