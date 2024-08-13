import 'dart:io' show Platform;

class Constants {
  static const referenceHeight = 896;
  static const referenceWidth = 414;
  String currentPlatfrom = Platform.isAndroid
      ? "android"
      : Platform.isIOS
          ? "iOS"
          : "other";
  static const String baseurl = 'https://66b8d2703ce57325ac783a72.mockapi.io/ecomapi/v1/';
}
