import 'dart:io' show Platform;

class Constants {
  static const referenceHeight = 896;
  static const referenceWidth = 414;
  String currentPlatfrom = Platform.isAndroid
      ? "android"
      : Platform.isIOS
          ? "iOS"
          : "other";
}
