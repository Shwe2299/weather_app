import 'package:flutter/cupertino.dart';

class ScreenSize {
  final BuildContext context;

  ScreenSize(this.context);

  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }
}
